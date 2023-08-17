# amplify_react_test
Testing AWS Amplify with React frontend, Dynamo DB backend and Python Lambda services

## Project directory structure

project-name/
│
├── terraform/                      # Root directory for all Terraform configurations
│   ├── main.tf                     # Main Terraform configuration file
│   ├── variables.tf                # Terraform variables declaration
│   ├── outputs.tf                  # Terraform outputs declaration
│   ├── backend.tf                  # (Optional) Backend configuration if you're using one
│   │
│   ├── dynamodb/                   # Terraform configurations specific to DynamoDB
│   │   └── dynamodb.tf             # DynamoDB related Terraform code
│   │
│   ├── lambda/                     # Terraform configurations specific to Lambda
│   │   └── lambda.tf               # Lambda related Terraform code
│   │
│   └── modules/                    # Terraform modules if you're using any
│       ├── module1/                # Example module directory
│       └── ...
│
├── lambdas/                       # Root directory for all Lambda functions
│   ├── function-name1/             # Directory for a specific Lambda function
│   │   ├── lambda_function.py      # Python code for the Lambda function
│   │   └── requirements.txt        # Any dependencies for this Lambda
│   │
│   ├── function-name2/
│   └── ...
│
├── scripts/                       # Useful scripts e.g., for packaging Lambdas
│   └── package_lambda.sh
│
├── .gitignore                     # Git ignore file
└── README.md                      # Project documentation

