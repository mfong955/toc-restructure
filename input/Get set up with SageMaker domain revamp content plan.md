# Get set up with SageMaker domain revamp content plan

[This is an old file for reference]

### Resources

* Domains/Console PM ([Pooja Karadgi](https://quip-amazon.com/BRZ9EAKnQLK)) plan: [Improve SageMaker Admin Docs](https://quip-amazon.com/MsPnARNusVyW)
* My previous (now outdated) plan: [Get started ToC restructure](https://quip-amazon.com/9PEQAL91brn3)
    * Note and classifications of each page are still useful

* * *

## Issues

* The second SageMaker node ([Setting up SageMaker AI](https://docs.aws.amazon.com/sagemaker/latest/dg/gs.html)) is outdated and disorganized. 
* All new users onboarding to SageMaker have trouble navigating the information.

* * *

## Goals 

Provide a workflow that simplifies things the most for new users setting up with SageMaker for the first time (admins). These administrators fall into two personas (**single users** and **organizations**) and so I wanted the setup instructions to reflect that, fast track lane to getting set up ASAP for both. 

* For **single users** this is already done, but can be updated if you see a faster path. 
* For **organizations** the admins most likely needs to set up a custom domain to set up permissions for different teams in their organization.
    * If they are already experienced, they just want to use the docs for **set up** or **updating** an existing domain. So I want to break these up into different nodes. Both will have brief description of concepts, but will point to the **concepts** node for more information if needed.
    * If they are not familiar, we need to introduce them to the **concepts** node. However, if they do not know the concepts and jump to **set up**, then we want to provide references to the concepts regularly.

Streamlining the docs for the different setups can take a while since you’ll be getting comfortable with domains. This took me a long time playing with the various setups and talking to engineers. Contact the Domains/Console PM if you need contacts for this.

So the [Setting up SageMaker AI](https://docs.aws.amazon.com/sagemaker/latest/dg/gs.html) node table of contents (ToC) might look like: 


|Proposed 1st level ToC	|What it *will* contain	|
|---	|---	|
|[Get started](https://docs.aws.amazon.com/sagemaker/latest/dg/gs.html)	|	|Points to **single user** vs. **advanced user** instructions & mention where they can skip
Give strucure of chapter	|
|	|Setup instructions	|PrerequisitesQuick setup Custom setups include IAM users and IdC. Provide instructions and light conceptual reminders, but for details point to relevant concept pages	|
|Domain concepts	|What is a domain and what it containsIntroduce best practices least permission roles, introduce admin responsibilitiesIntro to users, IAM users, and IAM IdC;Domain settings, like VPC, etc.	|
|Admin tasks/domain management	|All things updating the domain (the following can point to Studio docs since there may overlap)Viewing/creating/stopping resources in domainLimiting resourcesView/add/remove users/groupsMultiple domainsAttaching custom EFSPoint to IAM users/groups/IdC	|

* * *

## Plan

1. Plan out the changes and implementation in phases. It is recommended to rearrange the ToC FIRST before changing the text or section IDs. Otherwise doing both can get messy with references (xref and unlinks). 
2. Phase 1: Rearrange pages in the ToC
3. Phase 2: Delete and Update the language (not necessarily the content, unless you know for sure what to change), so that the page fits within its new context.

### Phase 1

* Rearrange ToC for two personas
    * **Single users**, who just want to get started and doesn’t care about custom setup, can get to the [quick setup](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-quick-start.html) ASAP. This is already done but can be open to improvements.
    * **Organizations**, who care about custom setup, need to understand concepts and the complicated setup.
    *  You can use the [Get started ToC restructure](https://quip-amazon.com/9PEQAL91brn3) as reference, though the content needs to be updated.
* ToC guidance
    * **Single users**
        * (Already done but open to improvements) Get to the [quick setup](https://docs.aws.amazon.com/sagemaker/latest/dg/onboard-quick-start.html) ASAP and tell them where to go next. These users do not need to know about domains, so avoid the usage of the word “domain”, unless necessary. 
    * **Organizations**
        * SageMaker domain **concepts**
        * How to **set up** a customized domain based on the concepts
        * How to **update** an already existing domain

### Phase 2

This should be planned out before Phase 1, so that you know what to edit beforehand and avoid merge conflicts. This should just mostly make the page fit into the new context. For example, if a page is split into a **concepts** and **set up** page, the language would need to be updated for each.









