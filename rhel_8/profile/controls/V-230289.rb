# encoding: UTF-8

control 'V-230289' do
  title "The RHEL 8 SSH daemon must not allow compression or must only allow
compression after successful authentication."
  desc  "If compression is allowed in an SSH connection prior to
authentication, vulnerabilities in the compression software could result in
compromise of the system from an unauthenticated connection, potentially with
root privileges."
  desc  'rationale', ''
  desc  'check', "
    Verify the SSH daemon performs compression after a user successfully
authenticates with the following command:

    $ sudo grep -i compression /etc/ssh/sshd_config

    Compression no

    If the \"Compression\" keyword is set to \"yes\", \"delayed\", is missing,
or the returned line is commented out, this is a finding.
  "
  desc  'fix', "
    Uncomment the \"Compression\" keyword in \"/etc/ssh/sshd_config\" (this
file may be named differently or be in a different location if using a version
of SSH that is provided by a third-party vendor) on the system and set the
value to \"no\":

    Compression no

    The SSH service must be restarted for changes to take effect.
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000480-GPOS-00227'
  tag gid: 'V-230289'
  tag rid: 'SV-230289r599732_rule'
  tag stig_id: 'RHEL-08-010510'
  tag fix_id: 'F-32933r567614_fix'
  tag cci: ['CCI-000366']
  tag nist: ['CM-6 b']
end

