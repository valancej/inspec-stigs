# encoding: UTF-8

control 'V-230239' do
  title 'The krb5-workstation package must not be installed on RHEL 8.'
  desc  "Unapproved mechanisms that are used for authentication to the
cryptographic module are not verified and therefore cannot be relied upon to
provide confidentiality or integrity, and DoD data may be compromised.

    RHEL 8 systems utilizing encryption are required to use FIPS-compliant
mechanisms for authenticating to cryptographic modules.

    Currently, Kerberos does not utilize FIPS 140-2 cryptography.

    FIPS 140-2 is the current standard for validating that mechanisms used to
access cryptographic modules utilize authentication that meets DoD
requirements. This allows for Security Levels 1, 2, 3, or 4 for use on a
general-purpose computing system.
  "
  desc  'rationale', ''
  desc  'check', "
    Verify the krb5-workstation package has not been installed on the system
with the following commands:

    $ sudo yum list installed krb5-workstation

    krb5-workstation.x86_64
1.17-9.el8                                                  repository

    If the krb5-workstation package is installed and is not documented with the
Information System Security Officer (ISSO) as an operational requirement, this
is a finding.
  "
  desc  'fix', "
    Document the krb5-workstation package with the ISSO as an operational
requirement or remove it from the system with the following command:

    $ sudo yum remove krb5-workstation
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000120-GPOS-00061'
  tag gid: 'V-230239'
  tag rid: 'SV-230239r599732_rule'
  tag stig_id: 'RHEL-08-010162'
  tag fix_id: 'F-32883r567464_fix'
  tag cci: ['CCI-000803']
  tag nist: ['IA-7']
end

