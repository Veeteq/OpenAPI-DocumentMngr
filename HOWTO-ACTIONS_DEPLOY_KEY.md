# Setting Up GitHub Secrets for Deploying to GitHub Pages

To publish a repository to GitHub Pages using GitHub Actions, you need to set up the necessary secrets in your GitHub repository. Follow these detailed steps to generate an SSH deploy key and add it to your repository secrets.

## Step 1: Generate an SSH Deploy Key

1. **Open Terminal or Command Prompt**:
   - On your local machine, open a terminal (Linux/Mac) or Command Prompt (Windows).

2. **Generate SSH Key**:
   - Run the following command to generate a new SSH key pair. Replace `your_email@example.com` with your GitHub email address.
     ```bash
     ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
     ```
   - When prompted, press `Enter` to accept the default file location (usually `~/.ssh/id_rsa`).
   - You can also set a passphrase for added security, but for GitHub Actions, it's often easier to leave it empty (just press `Enter`).

3. **Locate the SSH Key**:
   - After generating the key, you will have two files:
     - `id_rsa` (private key)
     - `id_rsa.pub` (public key)

## Step 2: Add the SSH Key to GitHub

1. **Copy the Public Key**:
   - Open the public key file using a text editor or run the following command to copy it to your clipboard:
     ```bash
     cat ~/.ssh/id_rsa.pub
     ```
   - Make sure to copy the entire content of the public key.

2. **Go to GitHub Repository**:
   - Navigate to your GitHub repository in your web browser.

3. **Access Settings**:
   - Click on the `Settings` tab in the repository.

4. **Add Deploy Key**:
   - In the left sidebar, click on `Deploy keys`.
   - Click on the `Add deploy key` button.
   - Give your key a title (e.g., "GitHub Actions Deploy Key").
   - Paste the public key you copied earlier into the "Key" field.
   - Check the box for "Allow write access" if you want to enable write access.
   - Click on the `Add key` button to save.

## Step 3: Add the Private Key as a Secret

1. **Copy the Private Key**:
   - Open the private key file using a text editor or run the following command to copy it to your clipboard:
     ```bash
     cat ~/.ssh/id_rsa
     ```
   - Make sure to copy the entire content of the private key.

2. **Go to GitHub Repository Settings**:
   - Navigate back to your GitHub repository in your web browser.

3. **Access Secrets**:
   - In the left sidebar, click on `Secrets and variables`, then click on `Actions`.

4. **Add New Secret**:
   - Click on the `New repository secret` button.
   - Name the secret `ACTIONS_DEPLOY_KEY`.
   - Paste the private key you copied earlier into the "Value" field.
   - Click on the `Add secret` button to save.

## Step 4: Verify the GitHub Actions Workflow

1. **Check the Workflow File**:
   - Ensure that the workflow file is correctly configured and saved in the `.github/workflows` directory of your repository.

2. **Push Changes**:
   - If you made any changes to the workflow file, commit and push those changes to your repository.

3. **Trigger the Workflow**:
   - You can trigger the workflow by pushing a change to the repository or manually triggering it from the Actions tab.

## Step 5: Monitor the Workflow Execution

1. **Check Actions Tab**:
   - Go to the `Actions` tab in your GitHub repository to monitor the execution of the workflow.
   - If everything is set up correctly, the workflow should execute without the previous error.

## Troubleshooting

- If you still encounter errors, double-check that the private key is correctly added as a secret and that the public key is correctly added as a deploy key.
- Ensure that the `peaceiris/actions-gh-pages` action is correctly configured in your workflow file.

By following these steps, you should be able to set up the necessary secrets and resolve any errors encountered during the GitHub Actions execution.
