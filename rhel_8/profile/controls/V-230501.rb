# encoding: UTF-8

control 'V-230501' do
  title 'RHEL 8 must enforce SSHv2 for network access to all accounts.'
  desc  "A replay attack may enable an unauthorized user to gain access to RHEL
8. Authentication sessions between the authenticator and RHEL 8 validating the
user credentials must not be vulnerable to a replay attack.

    An authentication process resists replay attacks if it is impractical to
achieve a successful authentication by recording and replaying a previous
authentication message.

    A privileged account is any information system account with authorizations
of a privileged user.

    Techniques used to address this include protocols using nonces (e.g.,
numbers generated for a specific one-time use) or challenges (e.g., TLS,
WS_Security). Additional techniques include time-synchronous or
challenge-response one-time authenticators.

    RHEL 8 incorporates OpenSSH as a default ssh provider. OpenSSH has been a
100 percent SSHv2 implementation since version 7.6 in late 2017 and dropped
support of SSH protocol version 1.


  "
  desc  'rationale', ''
  desc  'check', "
    Verify that RHEL 8 enforces SSH protocol 2 for network access.

    Check the SSH version that RHEL 8 is using with the following command:

    $ sudo yum list installed openssh

    openssh.x86_64    8.0p1-3.el8

    If the version of OpenSSH is newer than 7.6 the system is utilizing SSHv2
and is compliant.

    If the version of OpenSSH is older than 7.6 or is a different SSH package,
check the protocol versions that SSH allows with the following command:

    $ sudo grep -i protocol /etc/ssh/sshd_config

    Protocol 2

    If the returned line allows for use of protocol \"1\", is commented out, or
the line is missing, this is a finding.
  "
  desc  'fix', "
    Configure RHEL 8 to enforce SSHv2 for network access to all accounts via
OpenSSH or by updating the SSH configuration to enforce SSHv2.

    Install OpenSSH with the following command:

    $ sudo yum -y install openssh.x86_64

    or

    Add or update the following line in the \"/etc/ssh/sshd_config\" file:

    Protocol 2

    Restart the ssh service.

    $ sudo systemctl restart sshd.service
  "
  impact 0.7
  tag severity: 'high'
  tag gtitle: 'SRG-OS-000112-GPOS-00057'
  tag satisfies: ['SRG-OS-000112-GPOS-00057', 'SRG-OS-000113-GPOS-00058']
  tag gid: 'V-230501'
  tag rid: 'SV-230501r599732_rule'
  tag stig_id: 'RHEL-08-040060'
  tag fix_id: 'F-33145r568250_fix'
  tag cci: ['CCI-001941']
  tag nist: ['IA-2 (8)']
end

