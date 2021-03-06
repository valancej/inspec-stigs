# encoding: UTF-8

control 'V-230348' do
  title "RHEL 8 must enable a user session lock until that user re-establishes
access using established identification and authentication procedures for
command line sessions."
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
    Verify the operating system enables the user to initiate a session lock on
command.

    Verify RHEL 8 has the \"tmux\" package installed, by running the following
command:

    $ sudo yum list installed tmux

    tmux.x86.64                                                 2.7-1.el8
                                                  @repository

    If \"tmux\" is not installed, this is a finding.

    Next verify that the lock-command is set in the global settings of tmux
with the following command:

    $ sudo grep -i lock-command /etc/tmux.conf

    set -g lock-command vlock

    If the \"lock-command\" is not set in the global settings to call
\"vlock\", this is a finding.
  "
  desc  'fix', "
    Configure the operating system to enable a user to initiate a session lock
via tmux.

    Install the \"tmux\" package, if it is not already installed, by running
the following command:

    $ sudo yum install tmux

    Once installed, create a global configuration file \"/etc/tmux.conf\" and
add the following line:

    set -g lock-command vlock
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000028-GPOS-00009'
  tag satisfies: ['SRG-OS-000028-GPOS-00009', 'SRG-OS-000030-GPOS-00011']
  tag gid: 'V-230348'
  tag rid: 'SV-230348r599732_rule'
  tag stig_id: 'RHEL-08-020040'
  tag fix_id: 'F-32992r567791_fix'
  tag cci: ['CCI-000056']
  tag nist: ['AC-11 b']
end

