import boto3
import json
import time

# Initialize boto3 client
lambda_client = boto3.client('lambda')

# Function to invoke Lambda
def invoke_lambda(payload, function_name):
    response = lambda_client.invoke(
        FunctionName=function_name,
        InvocationType='RequestResponse',
        Payload=json.dumps(payload)
    )
    return response

# Function to simulate load
def simulate_load(payloads, function_name, iterations=10):
    durations = []
    for i in range(iterations):
        start_time = time.time()
        response = invoke_lambda(payloads[i % len(payloads)], function_name)
        end_time = time.time()
        durations.append(end_time - start_time)
        print(f"Iteration {i+1}: Duration {end_time - start_time} seconds.")
        # Add delay if necessary to mimic real-world usage
        # time.sleep(1)
    
    avg_duration = sum(durations) / len(durations)
    print(f"Average Invocation Duration: {avg_duration} seconds.")

# Example payloads
payloads = [
    {'key1': 'value1'},
    {'key2': 'value2'},
    # Add more payloads as needed
]

# Replace 'your_lambda_function_name' with your actual Lambda function name
function_name = 'your_lambda_function_name'

# Simulate load
simulate_load(payloads, function_name, iterations=100)
