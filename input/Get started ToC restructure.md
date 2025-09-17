# Get started ToC restructure

[This is an old file for reference]

|Current Get started ToC (outdated. Now called Setting up)	|What it *currently* contains	|Belongs to which group	|Structural changes	|	|Proposed 1st level ToC	|What it *will* contain	|	|Proposed ToC	|What it *will* contain	|Relevant pages	|	|Current Get started ToC	|What it *currently* contains	|Belongs to which group	|Structural changes	|Individual page updates	|
|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|---	|
|[Get started](https://docs.aws.amazon.com/sagemaker/latest/dg/gs.html)	|	|	|	|	|Points to **single user** vs. **advanced user** instructions	|Top	|	|	|[Get started](https://docs.aws.amazon.com/sagemaker/latest/dg/gs.html)	|Top	|Points to **single user** vs. **advanced user** instructions & mention where they can skip
Give strucure of chapter 	|	|[Get started](https://docs.aws.amazon.com/sagemaker/latest/dg/gs.html)	|	|	|	|	|	|	|[Get started](https://docs.aws.amazon.com/sagemaker/latest/dg/gs.html)	|	|	|	|	|Points to **single user** vs. **advanced user** instructions	|Top	|	|Get rid of quick setup detailsMove note to top	|
|	|[Set Up Amazon SageMaker Prerequisites](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-set-up.html)	|	|	|	|How to set up an AWS account, admin user, and CLI permissions	|Setup instructions	|	|	|	|Setup instructions	|Prerequisite

quick domain

custom domain setups include IAM users and IdC. Provide instructions, but for details point to somewhere belwo	|	|	|Prerequisites	|	|	|Sections: Point to intro to SM; (optional) Studio Lab; If you already have presigned URL, SETUP: prerequisites, then below
Prerequisites: Sets up AWS account, admin, and CLI to be able to create/manage domain	|[Prerequisites](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-prerequisites.html)	|	|	|[Set Up Amazon SageMaker Prerequisites](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-set-up.html)	|	|	|	|How to set up an AWS account, admin user, and CLI permissions	|Setup instructions	|	|	|
|	|[Domain overview](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-studio-onboard.html)	|	|	|	|What a domain is composed of. For some reason goes into IAM and IdC users, though maybe not necessary at this point?

Should include admin roles and organization structure with multiple domains?	|What is a domain	|	|	|	|	|Quick setup	|	|	|Quick setup: **single user** setup instructions + default settings for the domain	|[Custom onboarding using IAM Identity Center](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-sso-users.html)	|	|	|[Domain overview](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-studio-onboard.html)	|	|	|	|What a domain is composed of. For some reason goes into IAM and IdC users, though maybe not necessary at this point?

Should include admin roles and organization structure with multiple domains?	|What is a domain	|	|	|
|	|	|[SageMaker domain](https://docs.aws.amazon.com/sagemaker/latest/dg/sm-domain.html)	|	|	|Domain entities (domain, userprofile, shared space, app) and their statuses. Also maintenence	|What is a domain	|	|	|	|	|Custom setup	|	|	|Custom setup: **advanced user** setup instructions + points to What is a domain and Manage your domain	|[Set up IAM Identity Center](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-sso-setup.html)[Custom onboarding using IAM Identity Center](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-sso-users.html)[Custom onboarding using IAM](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-iam.html)	|	|	|	|[SageMaker domain](https://docs.aws.amazon.com/sagemaker/latest/dg/sm-domain.html)	|	|	|Domain entities (domain, userprofile, shared space, app) and their statuses. Also maintenence	|What is a domain	|	|	|
|	|	|	|[Prerequisites](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-prerequisites.html)	|	|Page not necessary, just says you need CLI access	|delete	|delete	|	|What is a domain	|What is a domain and what it contains;

introduce best practices least permission roles, introduce admin responsibilities;

intro to users, IAM users, and IAM IdC;

Domain settings, like VPC, etc.	|	|	|	|	|	|	|	|	|	|	|	|[Prerequisites](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-prerequisites.html)	|	|Page not necessary, just says you need CLI access	|delete	|delete	|	|
|	|	|	|[Multiple domains overview](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-multiple.html)	|	|Multiple domain details. Resource tagging, resource display filtering (does not exaplian what that is)

Should include admin roles and organization structure with multiple domains?Should include admin roles and organization structure with multiple domains?	|Admin tasks/domain management	|	|	|	|	|What is a domain	|	|	|What a domain contains; entities	|[Domain overview](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-studio-onboard.html)[SageMaker domain](https://docs.aws.amazon.com/sagemaker/latest/dg/sm-domain.html)	|	|	|	|	|[Multiple domains overview](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-multiple.html)	|	|Multiple domain details. Resource tagging, resource display filtering (does not exaplian what that is)

Should include admin roles and organization structure with multiple domains?Should include admin roles and organization structure with multiple domains?	|Admin tasks/domain management	|	|	|
|	|	|	|[Domain resource isolation](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-resource-isolation.html)	|	|Isolating resources based on domains (should be topic of multiple domains, then)	|Admin tasks/domain management	|Change to someghine like Managing permissions with custom policies 	|	|	|	|	|Domain best practices	|	|best practices; admin responsibilities; IAM users/IdC	|[Domain user profiles](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-user-profile.html)[Set up IAM Identity Center](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-sso-setup.html)whitepaper	|	|	|	|	|[Domain resource isolation](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-resource-isolation.html)	|	|Isolating resources based on domains (should be topic of multiple domains, then)	|Admin tasks/domain management	|	|Change to someghine like Managing permissions with custom policies 
Include [Proactive - Deny Bypass on certain ResourceTags Based conditions for SageMaker:Create* Actions](https://quip-amazon.com/HDxrATkXx0Ls)	|
|	|	|	|[Setting defaults for a domain](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-set-defaults.html)	|	|Set default settings for users within domain. 	|Admin tasks/domain management	|	|	|Admin tasks/domain management	|All things updating the domain

Viewing/creating/stopping resources in domain

Limiting resources

View/add/remove users/groups

Multiple domains

attaching custom EFS

Point to IAM users/groups/IdC	|	|	|	|VPC	|	|VPC	|[Choose an Amazon VPC](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-vpc.html)	|	|	|	|	|[Setting defaults for a domain](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-set-defaults.html)	|	|Set default settings for users within domain. 	|Admin tasks/domain management	|	|	|
|	|	|	|[Attaching a custom file system](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-custom-efs.html)	|	|Attach custom EFS to a space. 

Could benefit from having diagram/description of what a space contains?	|Admin tasks/domain management	|	|	|	|	|	|Regions/Quotas	|	|	|[Supported Regions and Quotas](https://docs.aws.amazon.com/sagemaker/latest/dg/regions-quotas.html)	|	|	|	|	|[Attaching a custom file system](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-custom-efs.html)	|	|Attach custom EFS to a space. 

Could benefit from having diagram/description of what a space contains?	|Admin tasks/domain management	|	|	|
|	|	|	|[Environment](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-space-environment.html)	|	|Domain environments (custom images [language and dependencies to run the app], lifecycle configurations, and git repositories) and points to instructions. Console instructions lacking	|Admin tasks/domain management	|	|	|	|	|	|	|	|	|	|	|	|	|	|[Environment](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-space-environment.html)	|	|Domain environments (custom images [language and dependencies to run the app], lifecycle configurations, and git repositories) and points to instructions. Console instructions lacking	|Admin tasks/domain management	|	|	|
|	|	|	|[View and edit domains](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-view-edit.html)	|	|View and edit domains very high overview. 

Create sections on view and delete/stop resources and c/p or link to the one in Studio https://docs.aws.amazon.com/sagemaker/latest/dg/studio-updated-running.html	|Admin tasks/domain management	|	|	|	|	|Admin tasks/domain management	|	|	|Intro to admin tasks; point to best practices with roles and admin responsibilties	|	|	|	|	|	|[View and edit domains](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-view-edit.html)	|	|View and edit domains very high overview. 

Create sections on view and delete/stop resources and c/p or link to the one in Studio https://docs.aws.amazon.com/sagemaker/latest/dg/studio-updated-running.html	|Admin tasks/domain management	|	|	|
|	|	|	|[Delete a domain](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-studio-delete-domain.html)	|	|Delete domain instructions	|Admin tasks/domain management	|	|	|	|SageMaker resources/tutorials	|<para>Learn how to use &SM; with hands-on tutorials to accomplish various machine learning
 lifecycle tasks, including data preparation, training, deployment, and MLOps, see <ulink
 type="marketing" url="sagemaker/getting-started/">Getting started with
 &SMlong;</ulink>. </para>

https://phonetool.amazon.com/users/matrubhc	|	|	|	|View/add/remove users or IdC groups	|	|	|[Add and Remove User Profiles](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-user-profile-add-remove.html)[View User Profiles and User Profile Details](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-user-profile-view-describe.html)[IAM Identity Center Groups in a domain](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-groups.html)	|	|	|	|	|[Delete a domain](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-studio-delete-domain.html)	|	|Delete domain instructions	|Admin tasks/domain management	|	|	|
|	|	|	|[Domain user profiles](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-user-profile.html)	|	|What a user is in a domain	|What is a domain	|Combine	|	|	|[GitHub](https://github.com/aws/amazon-sagemaker-examples)	|	|	|	|Control domain's default settings	|	|	|[Setting defaults for a domain](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-set-defaults.html)	|	|	|	|	|[Domain user profiles](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-user-profile.html)	|	|What a user is in a domain	|What is a domain	|Combine	|	|
|	|	|	|	|[Add and Remove User Profiles](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-user-profile-add-remove.html)	|Add/remove user instructions 

combine as topic in above	|Admin tasks/domain management	|	|	|[RTD website rendition of the repo](https://sagemaker-examples.readthedocs.io/en/latest/)	|	|	|	|Attach a custom file system	|	|	|[Attaching a custom file system](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-custom-efs.html)	|	|	|	|	|	|[Add and Remove User Profiles](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-user-profile-add-remove.html)	|Add/remove user instructions 

combine as topic in above	|Admin tasks/domain management	|	|
|	|	|	|	|[View User Profiles and User Profile Details](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-user-profile-view-describe.html)	|view user profiles and details instructions

combine as topic in above	|Admin tasks/domain management	|	|	|https://docs.aws.amazon.com/sagemaker/latest/dg/gs-console.html	|	|	|	|Customize domain's environment	|	|	|[Environment](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-space-environment.html)	|	|	|	|	|	|[View User Profiles and User Profile Details](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-user-profile-view-describe.html)	|view user profiles and details instructions

combine as topic in above	|Admin tasks/domain management	|	|
|	|	|	|[IAM Identity Center Groups in a domain](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-groups.html)	|	|View/add/remove users and groups instructions

Needs some information on what IAM users and IdC are	|Admin tasks/domain management	|	|	|	|https://aws.amazon.com/tutorials/ Anthony Paego owns those	|	|	|	|View and edit domains	|	|	|[View and edit domains](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-view-edit.html)	|	|	|	|	|[IAM Identity Center Groups in a domain](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-groups.html)	|	|View/add/remove users and groups instructions

Needs some information on what IAM users and IdC are	|Admin tasks/domain management	|	|	|
|	|	|[Quick onboarding](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-quick-start.html)	|	|	|Quick setup instructions and details	|Setup instructions	|	|	|	|[aws.amazon.com/getting-started](http://aws.amazon.com/getting-started)/hands-on Janelle Fowler owns	|	|	|	|Multiple domains	|	|	|[Multiple domains overview](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-multiple.html)[Domain resource isolation](https://docs.aws.amazon.com/sagemaker/latest/dg/domain-resource-isolation.html)	|	|	|	|[Quick onboarding](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-quick-start.html)	|	|	|Quick setup instructions and details	|Setup instructions	|	|Separate the default settings section to new page	|
|	|	|[Custom onboarding using IAM Identity Center](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-sso-users.html)	|	|	|Custom setup with IAM IdC [should include page below at top of this page]

Include benefits of IdC
Merge with Custom setup with IAM	|Setup instructions	|Combine	|	|	|	|Nadege: Putting this here for reference - [@mwfong](https://amzn-aws.slack.com/team/U048YHA49CH) for info ( I am probably missing some but that is what I have bookmarked)	|	|	|	|Delete a domain	|	|	|[Delete a domain](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-studio-delete-domain.html)	|	|	|	|[Custom onboarding using IAM Identity Center](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-sso-users.html)	|	|	|Custom setup with IAM IdC [should include page below at top of this page]

Include benefits of IdC
Merge with Custom setup with IAM	|Setup instructions	|Combine	|	|
|	|	|	|[Set up IAM Identity Center](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-sso-setup.html)	|	|Prereq for above, combine	|Setup instructions	|	|	|	|Github examples repo: https://github.com/aws/amazon-sagemaker-examples/blob/main/README.md	|	|	|	|	|	|	|	|	|	|	|	|[Set up IAM Identity Center](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-sso-setup.html)	|	|Prereq for above, combine	|Setup instructions	|	|
|	|	|[Custom onboarding using IAM](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-iam.html)	|	|	|Custon setup for IAM users. Mention IdC for larger groups. Combine with above	|Setup instructions	|	|	|	|Marketing website: https://aws.amazon.com/sagemaker/	|	|	|	|	|	|	|	|	|	|	|[Custom onboarding using IAM](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-iam.html)	|	|	|Custon setup for IAM users. Mention IdC for larger groups. Combine with above	|Setup instructions	|	|
|	|	|[Choose an Amazon VPC](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-vpc.html)	|	|	|VPC deets	|What is a domain	|	|	|	|	|Getting Started tutorials https://aws.amazon.com/sagemaker/getting-started/	|	|	|	|	|	|	|	|	|	|	|[Choose an Amazon VPC](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-vpc.html)	|	|	|VPC deets	|What is a domain	|	|	|
|	|[Supported Regions and Quotas](https://docs.aws.amazon.com/sagemaker/latest/dg/regions-quotas.html)	|	|	|	|Points to regions/endpoints/quotas pages	|What is a domain	|	|	|	|	|Hands on Tutorials: https://aws.amazon.com/getting-started/hands-on	|	|	|	|	|	|	|	|	|	|[Supported Regions and Quotas](https://docs.aws.amazon.com/sagemaker/latest/dg/regions-quotas.html)	|	|	|	|Points to regions/endpoints/quotas pages	|What is a domain	|	|	|
|	|	|	|	|	|	|	|	|	|	|	|Workshops: https://workshops.aws/card/SageMaker	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|
|	|	|	|	|	|	|	|	|	|	|	|Blogs: https://aws.amazon.com/blogs	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|
|	|	|	|	|	|	|	|	|	|	|	|Decision guide: https://aws.amazon.com/getting-started/decision-guides/machine-learning-on-aws-how-to-choose/	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|
|	|	|	|	|	|	|	|	|	|	|	|Architecture/White papers: https://docs.aws.amazon.com/whitepapers/latest/sagemaker-studio-admin-best-practices/sagemaker-studio-admin-best-practices.html?did=wp_card&trk=wp_card	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|
|	|	|	|	|	|	|	|	|	|	|	|re:post https://repost.aws/tags/TAT80swPyVRPKPcA0rsJYPuA?newRedirect=1&forumID=285	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|
|	|	|	|	|	|	|	|	|	|	|	|Case studies: https://aws.amazon.com/search/?searchQuery=sagemaker#facet_type=case_studies&page=1	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|
|	|	|	|	|	|	|	|	|	|	|	|(edited)	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|	|

