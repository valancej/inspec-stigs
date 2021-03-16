# encoding: UTF-8

control 'V-230553' do
  title "The graphical display manager must not be installed on RHEL 8 unless
approved."
  desc  "Internet services that are not required for system or application
processes must not be active to decrease the attack surface of the system.
Graphical display managers have a long history of security vulnerabilities and
must not be used, unless approved and documented."
  desc  'rationale', ''
  desc  'check', "
    Verify that the system is configured to boot to the command line:

    $ sudo systemctl get-default
    multi-user.target

    If the system default target is not set to \"multi-user.target\" and the
Information System Security Officer (ISSO) lacks a documented requirement for a
graphical user interface, this is a finding.

    Verify that a graphical user interface is not installed:

    $ sudo rpm -qa | grep xorg | grep server

    Ask the System Administrator if use of a graphical user interface is an
operational requirement.

    If the use of a graphical user interface on the system is not documented
with the ISSO, this is a finding.
  "
  desc  'fix', "
    Document the requirement for a graphical user interface with the ISSO or
remove the related packages with the following commands:

    $ sudo rpm -e xorg-x11-server-common

    $ sudo systemctl set-default multi-user.target
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000480-GPOS-00227'
  tag gid: 'V-230553'
  tag rid: 'SV-230553r599732_rule'
  tag stig_id: 'RHEL-08-040320'
  tag fix_id: 'F-33197r568406_fix'
  tag cci: ['CCI-000366']
  tag nist: ['CM-6 b']
end

