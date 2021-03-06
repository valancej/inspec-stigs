# encoding: UTF-8

control 'V-230483' do
  title "RHEL 8 must notify the System Administrator (SA) and Information
System Security Officer (ISSO) (at a minimum) when allocated audit record
storage volume reaches 75 percent of the repository maximum audit record
storage capacity."
  desc  "If security personnel are not notified immediately when storage volume
reaches 75 percent utilization, they are unable to plan for audit record
storage capacity expansion."
  desc  'rationale', ''
  desc  'check', "
    Verify RHEL 8 notifies the SA and ISSO (at a minimum) when allocated audit
record storage volume reaches 75 percent of the repository maximum audit record
storage capacity with the following commands:

    $ sudo grep space_left /etc/audit/auditd.conf

    space_left = 25%
    space_left_action = email

    If the value of the \"space_left\" keyword is not set to \"25%\" and the
\"space_left_action\" is not set to \"email\", or if these lines are commented
out, ask the System Administrator to indicate how the system is providing
real-time alerts to the SA and ISSO.

    If there is no evidence that real-time alerts are configured on the system,
this is a finding.
  "
  desc  'fix', "
    Configure the operating system to initiate an action to notify the SA and
ISSO (at a minimum) when allocated audit record storage volume reaches 75
percent of the repository maximum audit record storage capacity by
adding/modifying the following lines in the /etc/audit/auditd.conf file.

    space_left = 25%
    space_left_action = email

    Note: Option names and values in the auditd.conf file are case insensitive.
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000343-GPOS-00134'
  tag gid: 'V-230483'
  tag rid: 'SV-230483r599732_rule'
  tag stig_id: 'RHEL-08-030730'
  tag fix_id: 'F-33127r568196_fix'
  tag cci: ['CCI-001855']
  tag nist: ['AU-5 (1)']
end

