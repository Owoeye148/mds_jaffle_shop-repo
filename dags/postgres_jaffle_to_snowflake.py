from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.empty import EmptyOperator
from airflow.operators.dagrun_operator import TriggerDagRunOperator
from airflow.utils.trigger_rule import TriggerRule
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator
from airflow.providers.airbyte.sensors.airbyte import AirbyteJobSensor
import pendulum

from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from cosmos.operators import DbtRunOperationOperator
from cosmos.profiles import PostgresUserPasswordProfileMapping
from airflow.datasets import Dataset
from datetime import datetime

AIRBYTE_CONNECTION_ID = '69e2db52-dcc2-4e64-8d18-47942cd5a669'


with DAG(dag_id='postgres_jaffle_to_snowflake',
         default_args={'owner': 'airflow'},
         schedule='@daily',
         start_date=pendulum.today('UTC').add(days=-1)
    ) as dag:

    trigger_airbyte_sync = AirbyteTriggerSyncOperator(
        task_id='airbyte_trigger_sync',
        airbyte_conn_id='airbyte_conn',
        connection_id=AIRBYTE_CONNECTION_ID,
        asynchronous=True
    )

    wait_for_sync_completion = AirbyteJobSensor(
        task_id='airbyte_check_sync',
        airbyte_conn_id='airbyte_conn', 
        airbyte_job_id=trigger_airbyte_sync.output
    )

    run_this_last = EmptyOperator(
        task_id="job_sync_completed",
    )

    my_dbt_dag = TriggerDagRunOperator(
        task_id='trigger_dbt_jaffle',
        trigger_dag_id='run_dbt_jaffle',
        trigger_rule=TriggerRule.ALL_SUCCESS,
        dag=dag
    )

    my_snow_gx_dag = TriggerDagRunOperator(
        task_id='trigger_snow_gx_validation',
        trigger_dag_id='validate_jaffle_fact_orders_dim_customers',
        trigger_rule=TriggerRule.ALL_SUCCESS,
        dag=dag
    )

    trigger_airbyte_sync >> wait_for_sync_completion >> run_this_last >> my_dbt_dag >> my_snow_gx_dag