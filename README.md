# Terraform CI/CD Automation With Jenkins

## Project ToolBox 🧰

- [Git](https://git-scm.com/) — Git will be used to manage our application source code.
- [GitHub](https://github.com/) — GitHub is a free and open‑source distributed VCS designed to handle everything from small to very large projects with speed and efficiency.
- [Jenkins](https://www.jenkins.io/) — Jenkins is an open‑source automation CI tool that enables developers to reliably build, test, and deploy their software.
- [Snyk](https://snyk.io/) — Snyk gives you visibility, context, and control to work alongside developers on reducing application risk.
- [Checkov](https://www.checkov.io/) — Checkov scans cloud infrastructure configurations to find misconfigurations before they're deployed.
- [Slack](https://slack.com/) — Slack is a collaboration platform used to build a strong DevOps culture. It will be used for the continuous feedback loop.

---

## 1. Create a GitHub Repository

Create a GitHub repository named **`Terraform-CICD-Pipeline-Project`** and push the code from this branch (`main`) to your remote repository.

Steps:

1. Go to GitHub: <https://github.com>  
2. Log in to **your GitHub account**  
3. Create a repository named **`Terraform-CICD-Pipeline-Project`**  
4. Clone the repository to your local machine  
5. Download the code from the main branch of this repo:  
   <https://github.com/awanmbandi/realworld-cicd-pipeline-project.git>  
6. Unzip the downloaded file  
7. Copy/paste everything from the unzipped folder into your cloned repository  
8. Open your terminal and run:

   ```bash
   git add -A
   git commit -m "adding project source code"
   git push

   Confirm that the code is now available on GitHub as shown below...

<https://github.com/awanmbandi/realworld-cicd-pipeline-project/blob/zdocs/images/dsdsdsdgdghhgjkyutyrtegdgdr.png>

1) Create An IAM Profile/Role For The Jenkins Environment

- Create an EC2 Service Role in IAM with `AdministratorAccess` Privilege
- Navigate to IAM
![IAM!](https://github.com/awanmbandi/realworld-cicd-pipeline-project/blob/zdocs/images/Screen%20Shot%202023-10-03%20at%206.20.44%20PM.png)
  - Click on `Roles`
  - Click on `Create Role`
  - Select `Service Role`
  - Use Case: Select `EC2`
  - Click on `Next`
  - Attach Policy: `AdministratorAccess`
  - Click `Next`
  - Role Name: `AWS-AdministratorAccess-Role`
  - Click `Create`

1) Jenkins
    - Create a Jenkins VM instance
    - Name: `Jenkins-CI`
    - AMI: `Amazon Linux 2`
    - Instance type: `t2.medium`
    - Key pair: `Select` or `create a new keypair`
    - Security Group (Edit/Open): `8080` and `22` to `0.0.0.0/0`
    - IAM instance profile: Select the `AWS-AdministratorAccess-Role`
    - User data (Copy the following user data): <https://github.com/awanmbandi/realworld-cicd-pipeline-project/blob> \ terraform-jenkins-cicd-pipeline-project/installations/jenkins-install.sh
    - Launch Instance

2) Slack
    - Go to the bellow Workspace and create a Private Slack Channel and name it "yourfirstname-jenkins-cicd-pipeline-alerts"
    - Link: <https://join.slack.com/t/jjtechtowerba-zuj7343/shared_invite/zt-24mgawshy-EhixQsRyVuCo8UD~AbhQYQ>  
      - You can either join through the browser or your local Slack App
      - Create a `Private Channel` using the naming convention `YOUR_INITIAL-terraform-cicd-alerts`
        - **NOTE:** *`(The Channel Name Must Be Unique, meaning it must be available for use)`*
      - Visibility: Select `Private`
      - Click on the `Channel Drop Down` and select `Integrations` and Click on `Add an App`
      - Search for `Jenkins` and Click on `View`
      - Click on `Configuration/Install` and Click `Add to Slack`
      - On Post to Channel: Click the Drop Down and select your channel above `YOUR_INITIAL-terraform-cicd-alerts`
      - Click `Add Jenkins CI Integration`
      - Scrol Down and Click `SAVE SETTINGS/CONFIGURATIONS`
      - Leave this page open
      ![SlackConfig!](https://github.com/awanmbandi/realworld-cicd-pipeline-project/raw/zdocs/images/Screen%20Shot%202023-04-26%20at%202.08.55%20PM.png)

3) Install Plugins

- Snyk
- Slack
- Blue Ocean
- Pipeline: Stage View
