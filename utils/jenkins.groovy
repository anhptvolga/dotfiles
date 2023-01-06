import com.cloudbees.plugins.credentials.*;
import com.cloudbees.plugins.credentials.domains.Domain;
import org.jenkinsci.plugins.github_branch_source.GitHubAppCredentials
import com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey
import org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl
import org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl
import org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl
import com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl
import com.datapipe.jenkins.vault.credentials.VaultTokenCredential
import com.datapipe.jenkins.vault.credentials.common.VaultUsernamePasswordCredentialImpl
import com.datapipe.jenkins.vault.credentials.common.VaultStringCredentialImpl
import com.datapipe.jenkins.vault.credentials.VaultAppRoleCredential


SystemCredentialsProvider.getInstance().getCredentials().stream().
  filter { i -> "jenkins-id-luklak-org".equals( i.getId() ) }.
  map { cred -> (UsernamePasswordCredentialsImpl) cred }.
  forEach { cred ->
    println cred.getUsername()
    println cred.getPassword()
  }

SystemCredentialsProvider.getInstance().getCredentials().stream().
  filter { i -> "fileId".equals( i.getId() ) }.
  map { fileCred -> (StringCredentialsImpl) fileCred }.
  forEach { i ->
    String s = i.getSecret().getPalinText()
    println s
  }

SystemCredentialsProvider.getInstance().getCredentials().stream().
  map { fileCred -> (FileCredentialsImpl) fileCred }.
  filter { fileCred -> "fileId".equals( fileCred.getId() ) }.
  forEach { fileCred ->
    String s = new String( fileCred.getSecretBytes().getPlainData().encodeBase64().toString() )
    println "secret file with id = " + fileCred.getId()
    println s
    println ""
  }

