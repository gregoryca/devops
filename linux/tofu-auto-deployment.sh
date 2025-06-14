This is a bash script to set the variables for the auto_deployment or manual_approval stage

- bash: |

if [ "$TERRAFORM_PLAN_HAS_CHANGES" = true ] && [ "$TERRAFORM_PLAN_HAS_DESTROY_CHANGES" = false ] ; then

echo "##vso[task.setvariable variable=HAS_CHANGES_ONLY;isOutput=true]true"

echo "##vso[task.logissue type=warning]Changes with no destroys detected, it is safe for the pipeline to proceed automatically"

fi

if [ "$TERRAFORM_PLAN_HAS_CHANGES" = true ] && [ "$TERRAFORM_PLAN_HAS_DESTROY_CHANGES" = true ] ; then

echo "##vso[task.setvariable variable=HAS_DESTROY_CHANGES;isOutput=true]true"

echo "##vso[task.logissue type=warning]Changes with Destroy detected, pipeline will require a manual approval to proceed"

fi

if [ "$TERRAFORM_PLAN_HAS_CHANGES" != true ] ; then

echo "##vso[task.logissue type=warning]No changes detected, terraform apply will not run"

fi

name: "setvar"

displayName: "Set Variables for next stage"