Steps for this example
======================

Choose a region, everything will be created in that region

1 - run the cloudformation file
-------------------------------

This will create 3 objects:

1. A codebuild role with administrator access
2. An S3 bucket where the tfstate file will be saved
3. A codebuild project that will run the code

2 - run the codebuild to create your terraform environment
----------------------------------------------------------

To do this this is necessary click on the “Start the build" (blue button) inside codebuild.

This will trigger the creation of the security group in your environment.

Take a look to the CloudWatch logs and verify that everything is green in codebuild
