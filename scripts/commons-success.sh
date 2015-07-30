job_status=`curl http://ci.nature.com/jenkins/view/Other/job/hub-commons//lastBuild/api/json | grep "\"result\":\"SUCCESS\""`

if [ -n "$job_status" ]
then
    echo "COOL"
else
  echo "BUILD FAILURE: Other build is unsuccessful or status could not be obtained."
  exit 1
fi