# Summer JupyterHub

Contains a fully reproducible configuration for JupyterHub on
summer.datahub.berkeley.edu, as well as its single user image.

## Branches

The `staging` branch always reflects the state of the [staging JupyterHub](http://summer-test.datahub.berkeley.edu),
and the `prod` branch reflects the state of the [production JupyterHub](http://summer.datahub.berkeley.edu).

## Procedure

To make changes, fork this repo and [create a pull
request](https://help.github.com/articles/about-pull-requests/). The
choice for `base` in the GitHub PR user interface should be the staging
branch of this repo while the choice for `head` is your fork. The pull
request will trigger a [Travis CI](https://travis-ci.org/) process and
potentially a rebuild of docker images depending on what modifications
have been proposed. You can observe the status of the CI process by
visiting its link on the page for your PR, or by finding it on 
[Travis' build list](https://travis-ci.org/berkeley-dsep-infra/prob140hub/builds).

Once this is complete and if there are no problems, you can request that
someone review the PR before merging, or you can merge yourself if you
are confident. This merge will trigger another Travis step which
upgrades the helm deployment on the staging site. When this is complete,
test your changes there. For example if you updated a library, make sure
that a new user server instance has the new version. If you spot any
problems you can revert your change. You should test the changes soon
after the merge since we do not want unverified changes to linger in
staging.

If staging fails, *never* update production. Revert your change or 
call in help if necessary. If your change is successful, you will need
to merge the change from staging branch to production. Create another PR,
this time with the `base` set to prod and the `head` set to staging. This
PR will trigger a similar Travis process. Test your change on production
for good measure.
