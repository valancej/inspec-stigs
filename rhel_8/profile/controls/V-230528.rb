# encoding: UTF-8

control 'V-230528' do
  title "RHEL 8 must force a frequent session key renegotiation for SSH
connections by the client."
  desc  "Without protection of the transmitted information, confidentiality and
integrity may be compromised because unprotected communications can be
intercepted and either read or altered.

    This requirement applies to both internal and external networks and all
types of information system components from which information can be
transmitted (e.g., servers, mobile devices, notebook computers, printers,
copiers, scanners, and facsimile machines). Communication paths outside the
physical protection of a controlled boundary are exposed to the possibility of
interception and modification.

    Protecting the confidentiality and integrity of organizational information
can be accomplished by physical means (e.g., employing physical distribution
systems) or by logical means (e.g., employing cryptographic techniques). If
physical means of protection are employed, then logical means (cryptography) do
not have to be employed, and vice versa.

    Session key regeneration limits the chances of a session key becoming
compromised.


  "
  desc  'rationale', ''
  desc  'check', "
    Verify the SSH client is configured to force frequent session key
renegotiation with the following command:

    $ sudo grep -i RekeyLimit /etc/ssh/ssh_config

    RekeyLimit 1G 1h

    If \"RekeyLimit\" does not have a maximum data amount and maximum time
defined, is missing or commented out, this is a finding.
  "
  desc  'fix', "
    Configure the system to force a frequent session key renegotiation for SSH
connections by the client by add or modifying the following line in the
\"/etc/ssh/ssh_config\" file:

    RekeyLimit 1G 1h

    Restart the SSH daemon for the settings to take effect.

    $ sudo systemctl restart sshd.service
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000033-GPOS-00014'
  tag satisfies: ['SRG-OS-000033-GPOS-00014', 'SRG-OS-000420-GPOS-00186',
'SRG-OS-000424-GPOS-00188']
  tag gid: 'V-230528'
  tag rid: 'SV-230528r599732_rule'
  tag stig_id: 'RHEL-08-040162'
  tag fix_id: 'F-33172r568331_fix'
  tag cci: ['CCI-000068']
  tag nist: ['AC-17 (2)']
end

