# encoding: UTF-8

control 'V-230351' do
  title "RHEL 8 must be able to initiate directly a session lock for all
connection types using smartcard when the smartcard is removed."
  desc  "A session lock is a temporary action taken when a user stops work and
moves away from the immediate physical vicinity of the information system but
does not want to log out because of the temporary nature of the absence.

    The session lock is implemented at the point where session activity can be
determined. Rather than be forced to wait for a period of time to expire before
the user session can be locked, RHEL 8 needs to provide users with the ability
to manually invoke a session lock so users can secure their session if it is
necessary to temporarily vacate the immediate physical vicinity.

    Tmux is a terminal multiplexer that enables a number of terminals to be
created, accessed, and controlled from a single screen.  Red Hat endorses tmux
as the recommended session controlling package.


  "
  desc  'rationale', ''
  desc  'check', "
    Verify the operating system enables a user's session lock until that user
re-establishes access using established identification and authentication
procedures with the following command:

    $ sudo grep -R removal-action /etc/dconf/db/*

    /etc/dconf/db/distro.d/20-authselect:removal-action='lock-screen'

    If the \"removal-action='lock-screen'\" setting is missing or commented out
from the dconf database files, this is a finding.
  "
  desc  'fix', "
    Configure the operating system to enable a user's session lock until that
user re-establishes access using established identification and authentication
procedures.

    Select/Create an authselect profile and incorporate the
\"with-smartcard-lock-on-removal\" feature with the following example:

    $ sudo authselect select sssd with-smartcard with-smartcard-lock-on-removal

    Alternatively, the dconf settings can be edited in the /etc/dconf/db/*
location.

    Edit or add the \"[org/gnome/settings-daemon/peripherals/smartcard]\"
section of the database file and add or update the following lines:

    removal-action='lock-screen'

    Update the system databases:

    $ sudo dconf update
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000028-GPOS-00009'
  tag satisfies: ['SRG-OS-000028-GPOS-00009', 'SRG-OS-000030-GPOS-00011']
  tag gid: 'V-230351'
  tag rid: 'SV-230351r599792_rule'
  tag stig_id: 'RHEL-08-020050'
  tag fix_id: 'F-32995r599791_fix'
  tag cci: ['CCI-000056']
  tag nist: ['AC-11 b']
end

