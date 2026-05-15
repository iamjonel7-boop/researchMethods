MAKE(1)                 FreeBSD General Commands Manual                MAKE(1)

NNAAMMEE
     mmaakkee – maintain program dependencies

SSYYNNOOPPSSIISS
     mmaakkee [--BBeeiikkNNnnqqrrSSssttWWwwXX] [--CC _d_i_r_e_c_t_o_r_y] [--DD _v_a_r_i_a_b_l_e] [--dd _f_l_a_g_s]
          [--ff _m_a_k_e_f_i_l_e] [--II _d_i_r_e_c_t_o_r_y] [--JJ _p_r_i_v_a_t_e] [--jj _m_a_x___j_o_b_s]
          [--mm _d_i_r_e_c_t_o_r_y] [--TT _f_i_l_e] [--VV _v_a_r_i_a_b_l_e] [--vv _v_a_r_i_a_b_l_e]
          [_v_a_r_i_a_b_l_e==_v_a_l_u_e] [_t_a_r_g_e_t ...]

DDEESSCCRRIIPPTTIIOONN
     mmaakkee is a program designed to simplify the maintenance of other programs.
     Its input is a list of specifications as to the files upon which programs
     and other files depend.  If no --ff _m_a_k_e_f_i_l_e option is given, mmaakkee looks
     for the makefiles listed in _._M_A_K_E_._M_A_K_E_F_I_L_E___P_R_E_F_E_R_E_N_C_E (default
     ‘_m_a_k_e_f_i_l_e’, ‘_M_a_k_e_f_i_l_e’) in order to find the specifications.  If the file
     ‘_._d_e_p_e_n_d’ exists, it is read, see mkdep(1).

     This manual page is intended as a reference document only.  For a more
     thorough description of mmaakkee and makefiles, please refer to _P_M_a_k_e _- _A
     _T_u_t_o_r_i_a_l (from 1993).

     mmaakkee prepends the contents of the MAKEFLAGS environment variable to the
     command line arguments before parsing them.

     The options are as follows:

     --BB      Try to be backwards compatible by executing a single shell per
             command and by making the sources of a dependency line in
             sequence.

     --CC _d_i_r_e_c_t_o_r_y
             Change to _d_i_r_e_c_t_o_r_y before reading the makefiles or doing
             anything else.  If multiple --CC options are specified, each is
             interpreted relative to the previous one: --CC _/ --CC _e_t_c is
             equivalent to --CC _/_e_t_c.

     --DD _v_a_r_i_a_b_l_e
             Define _v_a_r_i_a_b_l_e to be 1, in the global scope.

     --dd [--]_f_l_a_g_s
             Turn on debugging, and specify which portions of mmaakkee are to
             print debugging information.  Unless the flags are preceded by
             ‘-’, they are added to the MAKEFLAGS environment variable and are
             passed on to any child make processes.  By default, debugging
             information is printed to standard error, but this can be changed
             using the FF debugging flag.  The debugging output is always
             unbuffered; in addition, if debugging is enabled but debugging
             output is not directed to standard output, the standard output is
             line buffered.  The available _f_l_a_g_s are:

             AA       Print all possible debugging information; equivalent to
                     specifying all of the debugging flags.

             aa       Print debugging information about archive searching and
                     caching.

             CC       Print debugging information about the current working
                     directory.

             cc       Print debugging information about conditional evaluation.

             dd       Print debugging information about directory searching and
                     caching.

             ee       Print debugging information about failed commands and
                     targets.

             FF[++]_f_i_l_e_n_a_m_e
                     Specify where debugging output is written.  This must be
                     the last flag, because it consumes the remainder of the
                     argument.  If the character immediately after the FF flag
                     is ‘+’, the file is opened in append mode; otherwise the
                     file is overwritten.  If the file name is ‘stdout’ or
                     ‘stderr’, debugging output is written to the standard
                     output or standard error output respectively (and the ‘+’
                     option has no effect).  Otherwise, the output is written
                     to the named file.  If the file name ends with ‘.%d’, the
                     ‘%d’ is replaced by the pid.

             ff       Print debugging information about loop evaluation.

             gg11      Print the input graph before making anything.

             gg22      Print the input graph after making everything, or before
                     exiting on error.

             gg33      Print the input graph before exiting on error.

             hh       Print debugging information about hash table operations.

             jj       Print debugging information about running multiple
                     shells.

             LL       Turn on lint checks.  This throws errors for variable
                     assignments that do not parse correctly, at the time of
                     assignment, so the file and line number are available.

             ll       Print commands in Makefiles regardless of whether or not
                     they are prefixed by ‘@’ or other “quiet” flags.  Also
                     known as “loud” behavior.

             MM       Print debugging information about “meta” mode decisions
                     about targets.

             mm       Print debugging information about making targets,
                     including modification dates.

             nn       Don't delete the temporary command scripts created when
                     running commands.  These temporary scripts are created in
                     the directory referred to by the TMPDIR environment
                     variable, or in _/_t_m_p if TMPDIR is unset or set to the
                     empty string.  The temporary scripts are created by
                     mkstemp(3), and have names of the form _m_a_k_e_X_X_X_X_X_X.  _N_O_T_E:
                     This can create many files in TMPDIR or _/_t_m_p, so use with
                     care.

             pp       Print debugging information about makefile parsing.

             ss       Print debugging information about suffix-transformation
                     rules.

             tt       Print debugging information about target list
                     maintenance.

             VV       Force the --VV option to print raw values of variables,
                     overriding the default behavior set via
                     _._M_A_K_E_._E_X_P_A_N_D___V_A_R_I_A_B_L_E_S.

             vv       Print debugging information about variable assignment and
                     expansion.

             xx       Run shell commands with --xx so the actual commands are
                     printed as they are executed.

     --ee      Let environment variables override global variables within
             makefiles.

     --ff _m_a_k_e_f_i_l_e
             Specify a makefile to read instead of one of the defaults listed
             in _._M_A_K_E_._M_A_K_E_F_I_L_E___P_R_E_F_E_R_E_N_C_E.  If _m_a_k_e_f_i_l_e is ‘-’, standard input
             is read.  If _m_a_k_e_f_i_l_e starts with the string ‘.../’, mmaakkee
             searches for the specified path in the rest of the argument in
             the current directory and its parents.  Multiple makefiles may be
             specified, and are read in the order specified.

     --II _d_i_r_e_c_t_o_r_y
             Specify a directory in which to search for makefiles and included
             makefiles.  The system makefile directory (or directories, see
             the --mm option) is automatically included as part of this list.

     --ii      Ignore non-zero exit of shell commands in the makefile.
             Equivalent to specifying ‘-’ before each command line in the
             makefile.

     --JJ _p_r_i_v_a_t_e
             This option should _n_o_t be specified by the user.

             When the --jj option is in use in a recursive build, this option is
             passed by a make to child makes to allow all the make processes
             in the build to cooperate to avoid overloading the system.

     --jj _m_a_x___j_o_b_s
             Specify the maximum number of jobs that mmaakkee may have running at
             any one time.  If _m_a_x___j_o_b_s is a floating point number, or ends
             with ‘C’, then the value is multiplied by the number of CPUs
             reported online by sysconf(3).  The value of _m_a_x___j_o_b_s is saved in
             _._M_A_K_E_._J_O_B_S.  Turns compatibility mode off, unless the --BB option
             is also specified.  When compatibility mode is off, all commands
             associated with a target are executed in a single shell
             invocation as opposed to the traditional one shell invocation per
             line.  This can break traditional scripts which change
             directories on each command invocation and then expect to start
             with a fresh environment on the next line.  It is more efficient
             to correct the scripts rather than turn backwards compatibility
             on.

             A job token pool with _m_a_x___j_o_b_s tokens is used to control the
             total number of jobs running.  Each instance of mmaakkee will wait
             for a token from the pool before running a new job.

     --kk      Continue processing after errors are encountered, but only on
             those targets that do not depend on the target whose creation
             caused the error.

     --mm _d_i_r_e_c_t_o_r_y
             Specify a directory in which to search for _s_y_s_._m_k and makefiles
             included via the <_f_i_l_e>-style include statement.  The --mm option
             can be used multiple times to form a search path.  This path
             overrides the default system include path _/_u_s_r_/_s_h_a_r_e_/_m_k.
             Furthermore, the system include path is appended to the search
             path used for "_f_i_l_e"-style include statements (see the --II
             option).  The system include path can be referenced via the read-
             only variable _._S_Y_S_P_A_T_H.

             If a directory name in the --mm argument (or the MAKESYSPATH
             environment variable) starts with the string ‘.../’, mmaakkee
             searches for the specified file or directory named in the
             remaining part of the argument string.  The search starts with
             the current directory and then works upward towards the root of
             the file system.  If the search is successful, the resulting
             directory replaces the ‘.../’ specification in the --mm argument.
             This feature allows mmaakkee to easily search in the current source
             tree for customized _s_y_s_._m_k files (e.g., by using ‘.../mk/sys.mk’
             as an argument).

     --nn      Display the commands that would have been executed, but do not
             actually execute them unless the target depends on the _._M_A_K_E
             special source (see below) or the command is prefixed with ‘++’.

     --NN      Display the commands that would have been executed, but do not
             actually execute any of them; useful for debugging top-level
             makefiles without descending into subdirectories.

     --qq      Do not execute any commands, instead exit 0 if the specified
             targets are up to date, and 1 otherwise.

     --rr      Do not use the built-in rules specified in the system makefile.

     --SS      Stop processing if an error is encountered.  This is the default
             behavior and the opposite of --kk.

     --ss      Do not echo any commands as they are executed.  Equivalent to
             specifying ‘@@’ before each command line in the makefile.

     --TT _t_r_a_c_e_f_i_l_e
             When used with the --jj flag, append a trace record to _t_r_a_c_e_f_i_l_e
             for each job started and completed.

     --tt      Rather than re-building a target as specified in the makefile,
             create it or update its modification time to make it appear up-
             to-date.

     --VV _v_a_r_i_a_b_l_e
             Print the value of _v_a_r_i_a_b_l_e.  Do not build any targets.  Multiple
             instances of this option may be specified; the variables are
             printed one per line, with a blank line for each null or
             undefined variable.  The value printed is extracted from the
             global scope after all makefiles have been read.

             By default, the raw variable contents (which may include
             additional unexpanded variable references) are shown.  If
             _v_a_r_i_a_b_l_e contains a ‘$’, it is not interpreted as a variable name
             but rather as an expression.  Its value is expanded before
             printing.  The value is also expanded before printing if
             _._M_A_K_E_._E_X_P_A_N_D___V_A_R_I_A_B_L_E_S is set to true and the --ddVV option has not
             been used to override it.

             Note that loop-local and target-local variables, as well as
             values taken temporarily by global variables during makefile
             processing, are not accessible via this option.  The --ddvv debug
             mode can be used to see these at the cost of generating
             substantial extraneous output.

     --vv _v_a_r_i_a_b_l_e
             Like --VV, but all printed variables are always expanded to their
             complete value.  The last occurrence of --VV or --vv decides whether
             all variables are expanded or not.

     --WW      Treat any warnings during makefile parsing as errors.

     --ww      Print entering and leaving directory messages, pre and post
             processing.

     --XX      Don't export variables passed on the command line to the
             environment individually.  Variables passed on the command line
             are still exported via the MAKEFLAGS environment variable.  This
             option may be useful on systems which have a small limit on the
             size of command arguments.

     _v_a_r_i_a_b_l_e==_v_a_l_u_e
             Set the value of the variable _v_a_r_i_a_b_l_e to _v_a_l_u_e.  Normally, all
             values passed on the command line are also exported to sub-makes
             in the environment.  The --XX flag disables this behavior.
             Variable assignments should follow options for POSIX
             compatibility but no ordering is enforced.

     There are several different types of lines in a makefile: dependency
     specifications, shell commands, variable assignments, include statements,
     conditional directives, for loops, other directives, and comments.

     Lines may be continued from one line to the next by ending them with a
     backslash (‘\’).  The trailing newline character and initial whitespace
     on the following line are compressed into a single space.

FFIILLEE DDEEPPEENNDDEENNCCYY SSPPEECCIIFFIICCAATTIIOONNSS
     Dependency lines consist of one or more targets, an operator, and zero or
     more sources.  This creates a relationship where the targets “depend” on
     the sources and are customarily created from them.  A target is
     considered out of date if it does not exist, or if its modification time
     is less than that of any of its sources.  An out-of-date target is re-
     created, but not until all sources have been examined and themselves re-
     created as needed.  Three operators may be used:

     ::     Many dependency lines may name this target but only one may have
           attached shell commands.  All sources named in all dependency lines
           are considered together, and if needed the attached shell commands
           are run to create or re-create the target.  If mmaakkee is interrupted,
           the target is removed.

     !!     The same, but the target is always re-created whether or not it is
           out of date.

     ::::    Any dependency line may have attached shell commands, but each one
           is handled independently: its sources are considered and the
           attached shell commands are run if the target is out of date with
           respect to (only) those sources.  Thus, different groups of the
           attached shell commands may be run depending on the circumstances.
           Furthermore, unlike ::, for dependency lines with no sources, the
           attached shell commands are always run.  Also unlike ::, the target
           is not removed if mmaakkee is interrupted.

     All dependency lines mentioning a particular target must use the same
     operator.

     Targets and sources may contain the shell wildcard values ‘?’, ‘*’, ‘[]’,
     and ‘{}’.  The values ‘?’, ‘*’, and ‘[]’ may only be used as part of the
     final component of the target or source, and only match existing files.
     The value ‘{}’ need not necessarily be used to describe existing files.
     Expansion is in directory order, not alphabetically as done in the shell.

SSHHEELLLL CCOOMMMMAANNDDSS
     Each target may have associated with it one or more lines of shell
     commands, normally used to create the target.  Each of the lines in this
     script _m_u_s_t be preceded by a tab.  (For historical reasons, spaces are
     not accepted.)  While targets can occur in many dependency lines if
     desired, by default only one of these rules may be followed by a creation
     script.  If the ‘::::’ operator is used, however, all rules may include
     scripts, and the respective scripts are executed in the order found.

     Each line is treated as a separate shell command, unless the end of line
     is escaped with a backslash ‘\’, in which case that line and the next are
     combined.  If the first characters of the command are any combination of
     ‘@@’, ‘++’, or ‘--’, the command is treated specially.

           @@       causes the command not to be echoed before it is executed.

           ++       causes the command to be executed even when --nn is given.
                   This is similar to the effect of the _._M_A_K_E special source,
                   except that the effect can be limited to a single line of a
                   script.

           --       in compatibility mode causes any non-zero exit status of
                   the command line to be ignored.

     When mmaakkee is run in jobs mode with --jj _m_a_x___j_o_b_s, the entire script for the
     target is fed to a single instance of the shell.  In compatibility (non-
     jobs) mode, each command is run in a separate process.  If the command
     contains any shell meta characters (‘#=|^(){};&<>*?[]:$`\\n’), it is
     passed to the shell; otherwise mmaakkee attempts direct execution.  If a line
     starts with ‘--’ and the shell has ErrCtl enabled, failure of the command
     line is ignored as in compatibility mode.  Otherwise ‘--’ affects the
     entire job; the script stops at the first command line that fails, but
     the target is not deemed to have failed.

     Makefiles should be written so that the mode of mmaakkee operation does not
     change their behavior.  For example, any command which uses “cd” or
     “chdir” without the intention of changing the directory for subsequent
     commands should be put in parentheses so it executes in a subshell.  To
     force the use of a single shell, escape the line breaks so as to make the
     whole script one command.  For example:

           avoid-chdir-side-effects:
                   @echo "Building $@ in $$(pwd)"
                   @(cd ${.CURDIR} && ${MAKE} $@)
                   @echo "Back in $$(pwd)"

           ensure-one-shell-regardless-of-mode:
                   @echo "Building $@ in $$(pwd)"; \
                   (cd ${.CURDIR} && ${MAKE} $@); \
                   echo "Back in $$(pwd)"

     Since mmaakkee changes the current working directory to ‘_._O_B_J_D_I_R’ before
     executing any targets, each child process starts with that as its current
     working directory.

VVAARRIIAABBLLEE AASSSSIIGGNNMMEENNTTSS
     Variables in make behave much like macros in the C preprocessor.

     Variable assignments have the form ‘_N_A_M_E _o_p _v_a_l_u_e’, where:

           _N_A_M_E    is a single-word variable name, consisting, by tradition,
                   of all upper-case letters,

           _o_p      is one of the variable assignment operators described
                   below, and

           _v_a_l_u_e   is interpreted according to the variable assignment
                   operator.

     Whitespace around _N_A_M_E, _o_p and _v_a_l_u_e is discarded.

   VVaarriiaabbllee aassssiiggnnmmeenntt ooppeerraattoorrss
     The five operators that assign values to variables are:

     ==       Assign the value to the variable.  Any previous value is
             overwritten.

     ++==      Append the value to the current value of the variable, separating
             them by a single space.

     ??==      Assign the value to the variable if it is not already defined.

     ::==      Expand the value, then assign it to the variable.

             _N_O_T_E: References to undefined variables are _n_o_t expanded.  This
             can cause problems when variable modifiers are used.

     !!==      Expand the value and pass it to the shell for execution, then
             assign the output from the child's standard output to the
             variable.  Any newlines in the result are replaced with spaces.

   EExxppaannssiioonn ooff vvaarriiaabblleess
     In most contexts where variables are expanded, ‘$$’ expands to a single
     dollar sign.  In other contexts (most variable modifiers, string literals
     in conditions), ‘\$’ expands to a single dollar sign.

     References to variables have the form $${{_n_a_m_e[::_m_o_d_i_f_i_e_r_s]}} or
     $$((_n_a_m_e[::_m_o_d_i_f_i_e_r_s])).  If the variable name consists of only a single
     character and the expression contains no modifiers, the surrounding curly
     braces or parentheses are not required.  This shorter form is not
     recommended.

     If the variable name contains a dollar, the name itself is expanded
     first.  This allows almost arbitrary variable names, however names
     containing dollar, braces, parentheses or whitespace are really best
     avoided.

     If the result of expanding a nested variable expression contains a dollar
     sign (‘$’), the result is subject to further expansion.

     Variable substitution occurs at four distinct times, depending on where
     the variable is being used.

     1.   Variables in dependency lines are expanded as the line is read.

     2.   Variables in conditionals are expanded individually, but only as far
          as necessary to determine the result of the conditional.

     3.   Variables in shell commands are expanded when the shell command is
          executed.

     4.   ..ffoorr loop index variables are expanded on each loop iteration.  Note
          that other variables are not expanded when composing the body of a
          loop, so the following example code:

                .for i in 1 2 3
                a+=     ${i}
                j=      ${i}
                b+=     ${j}
                .endfor

                all:
                        @echo ${a}
                        @echo ${b}

          prints:

                1 2 3
                3 3 3

          After the loop is executed:

                _a       contains ‘${:U1} ${:U2} ${:U3}’, which expands to ‘1 2
                        3’.

                _j       contains ‘${:U3}’, which expands to ‘3’.

                _b       contains ‘${j} ${j} ${j}’, which expands to ‘${:U3}
                        ${:U3} ${:U3}’ and further to ‘3 3 3’.

   VVaarriiaabbllee ccllaasssseess
     The four different classes of variables (in order of increasing
     precedence) are:

     Environment variables
             Variables defined as part of mmaakkee's environment.

     Global variables
             Variables defined in the makefile or in included makefiles.

     Command line variables
             Variables defined as part of the command line.

     Local variables
             Variables that are defined specific to a certain target.

     Local variables can be set on a dependency line, unless
     _._M_A_K_E_._T_A_R_G_E_T___L_O_C_A_L___V_A_R_I_A_B_L_E_S is set to ‘false’.  The rest of the line
     (which already has had global variables expanded) is the variable value.
     For example:

           COMPILER_WRAPPERS= ccache distcc icecc

           ${OBJS}: .MAKE.META.CMP_FILTER=${COMPILER_WRAPPERS:S,^,N,}

     Only the targets ‘${OBJS}’ are impacted by that filter (in “meta” mode)
     and simply enabling/disabling any of the compiler wrappers does not
     render all of those targets out-of-date.

     _N_O_T_E: target-local variable assignments behave differently in that;

           ++==      Only appends to a previous local assignment for the same
                   target and variable.

           ::==      Is redundant with respect to global variables, which have
                   already been expanded.

     The built-in local variables are:

           _._A_L_L_S_R_C   The list of all sources for this target; also known as
                     ‘_>’ or ‘_^’.

           _._A_R_C_H_I_V_E  The name of the archive file; also known as ‘_!’.

           _._I_M_P_S_R_C   In suffix-transformation rules, the name/path of the
                     source from which the target is to be transformed (the
                     “implied” source); also known as ‘_<’.  It is not defined
                     in explicit rules.

           _._M_E_M_B_E_R   The name of the archive member; also known as ‘_%’.

           _._O_O_D_A_T_E   The list of sources for this target that were deemed out-
                     of-date; also known as ‘_?’.

           _._P_R_E_F_I_X   The name of the target with suffix (if declared in
                     ..SSUUFFFFIIXXEESS) removed; also known as ‘_*’.

           _._T_A_R_G_E_T   The name of the target; also known as ‘_@’.  For
                     compatibility with other makes this is an alias for
                     _._A_R_C_H_I_V_E in archive member rules.

     The shorter forms (‘_>’, ‘_^’, ‘_!’, ‘_<’, ‘_%’, ‘_?’, ‘_*’, and ‘_@’) are
     permitted for backward compatibility with historical makefiles and legacy
     POSIX make and are not recommended.

     Variants of these variables with the punctuation followed immediately by
     ‘D’ or ‘F’, e.g. ‘$(@D)’, are legacy forms equivalent to using the ‘:H’
     and ‘:T’ modifiers.  These forms are accepted for compatibility with AT&T
     System V UNIX makefiles and POSIX but are not recommended.

     Four of the local variables may be used in sources on dependency lines
     because they expand to the proper value for each target on the line.
     These variables are ‘_._T_A_R_G_E_T’, ‘_._P_R_E_F_I_X’, ‘_._A_R_C_H_I_V_E’, and ‘_._M_E_M_B_E_R’.

   AAddddiittiioonnaall bbuuiilltt--iinn vvaarriiaabblleess
     In addition, mmaakkee sets or knows about the following variables:

     _._A_L_L_T_A_R_G_E_T_S
             The list of all targets encountered in the makefiles.  If
             evaluated during makefile parsing, lists only those targets
             encountered thus far.

     _._C_U_R_D_I_R
             A path to the directory where mmaakkee was executed.  Refer to the
             description of ‘_P_W_D’ for more details.

     _._E_R_R_O_R___C_M_D
             Is used in error handling, see _M_A_K_E___P_R_I_N_T___V_A_R___O_N___E_R_R_O_R.

     _._E_R_R_O_R___C_W_D
             Is used in error handling, see _M_A_K_E___P_R_I_N_T___V_A_R___O_N___E_R_R_O_R.

     _._E_R_R_O_R___E_X_I_T
             Is used in error handling, see _M_A_K_E___P_R_I_N_T___V_A_R___O_N___E_R_R_O_R.

     _._E_R_R_O_R___M_E_T_A___F_I_L_E
             Is used in error handling in “meta” mode, see
             _M_A_K_E___P_R_I_N_T___V_A_R___O_N___E_R_R_O_R.

     _._E_R_R_O_R___T_A_R_G_E_T
             Is used in error handling, see _M_A_K_E___P_R_I_N_T___V_A_R___O_N___E_R_R_O_R.

     _._I_N_C_L_U_D_E_D_F_R_O_M_D_I_R
             The directory of the file this makefile was included from.

     _._I_N_C_L_U_D_E_D_F_R_O_M_F_I_L_E
             The filename of the file this makefile was included from.

     _M_A_C_H_I_N_E
             The machine hardware name, see uname(1).

     _M_A_C_H_I_N_E___A_R_C_H
             The machine processor architecture name, see uname(1).

     _M_A_K_E    The name that mmaakkee was executed with (_a_r_g_v_[_0_]).

     _._M_A_K_E   The same as _M_A_K_E, for compatibility.  The preferred variable to
             use is the environment variable MAKE because it is more
             compatible with other make variants and cannot be confused with
             the special target with the same name.

     _._M_A_K_E_._A_L_W_A_Y_S___P_A_S_S___J_O_B___Q_U_E_U_E
             Tells mmaakkee whether to pass the descriptors of the job token queue
             even if the target is not tagged with ..MMAAKKEE The default is ‘_y_e_s’
             for backwards compatability with FreeBSD 9.0 and earlier.

     _._M_A_K_E_._D_E_P_E_N_D_F_I_L_E
             Names the makefile (default ‘_._d_e_p_e_n_d’) from which generated
             dependencies are read.

     _._M_A_K_E_._D_I_E___Q_U_I_E_T_L_Y
             If set to ‘true’, do not print error information at the end.

     _._M_A_K_E_._E_X_P_A_N_D___V_A_R_I_A_B_L_E_S
             A boolean that controls the default behavior of the --VV option.
             If true, variable values printed with --VV are fully expanded; if
             false, the raw variable contents (which may include additional
             unexpanded variable references) are shown.

     _._M_A_K_E_._E_X_P_O_R_T_E_D
             The list of variables exported by mmaakkee.

     _M_A_K_E_F_I_L_E
             The top-level makefile that is currently read, as given in the
             command line.

     _._M_A_K_E_F_L_A_G_S
             The environment variable ‘MAKEFLAGS’ may contain anything that
             may be specified on mmaakkee's command line.  Anything specified on
             mmaakkee's command line is appended to the _._M_A_K_E_F_L_A_G_S variable, which
             is then added to the environment for all programs that mmaakkee
             executes.

     _._M_A_K_E_._G_I_D
             The numeric group ID of the user running mmaakkee.  It is read-only.

     _._M_A_K_E_._J_O_B_._P_R_E_F_I_X
             If mmaakkee is run with --jj, the output for each target is prefixed
             with a token
                   --- _t_a_r_g_e_t ---
             the first part of which can be controlled via _._M_A_K_E_._J_O_B_._P_R_E_F_I_X.
             If _._M_A_K_E_._J_O_B_._P_R_E_F_I_X is empty, no token is printed.  For example,
             setting _._M_A_K_E_._J_O_B_._P_R_E_F_I_X to
             ‘${.newline}---${.MAKE:T}[${.MAKE.PID}]’ would produce tokens
             like
                   ---make[1234] _t_a_r_g_e_t ---
             making it easier to track the degree of parallelism being
             achieved.

     _._M_A_K_E_._J_O_B_S
             The argument to the --jj option.

     _._M_A_K_E_._J_O_B_S_._C
             A read-only boolean that indicates whether the --jj option supports
             use of ‘C’.

     _._M_A_K_E_._L_E_V_E_L
             The recursion depth of mmaakkee.  The top-level instance of mmaakkee has
             level 0, and each child make has its parent level plus 1.  This
             allows tests like: .if ${.MAKE.LEVEL} == 0 to protect things
             which should only be evaluated in the top-level instance of mmaakkee.

     _._M_A_K_E_._L_E_V_E_L_._E_N_V
             The name of the environment variable that stores the level of
             nested calls to mmaakkee.

     _._M_A_K_E_._M_A_K_E_F_I_L_E___P_R_E_F_E_R_E_N_C_E
             The ordered list of makefile names (default ‘_m_a_k_e_f_i_l_e’,
             ‘_M_a_k_e_f_i_l_e’) that mmaakkee looks for.

     _._M_A_K_E_._M_A_K_E_F_I_L_E_S
             The list of makefiles read by mmaakkee, which is useful for tracking
             dependencies.  Each makefile is recorded only once, regardless of
             the number of times read.

     _._M_A_K_E_._M_E_T_A_._B_A_I_L_I_W_I_C_K
             In “meta” mode, provides a list of prefixes which match the
             directories controlled by mmaakkee.  If a file that was generated
             outside of _._O_B_J_D_I_R but within said bailiwick is missing, the
             current target is considered out-of-date.

     _._M_A_K_E_._M_E_T_A_._C_M_P___F_I_L_T_E_R
             In “meta” mode, it can (very rarely!) be useful to filter command
             lines before comparison.  This variable can be set to a set of
             modifiers that are applied to each line of the old and new
             command that differ, if the filtered commands still differ, the
             target is considered out-of-date.

     _._M_A_K_E_._M_E_T_A_._C_R_E_A_T_E_D
             In “meta” mode, this variable contains a list of all the meta
             files updated.  If not empty, it can be used to trigger
             processing of _._M_A_K_E_._M_E_T_A_._F_I_L_E_S.

     _._M_A_K_E_._M_E_T_A_._F_I_L_E_S
             In “meta” mode, this variable contains a list of all the meta
             files used (updated or not).  This list can be used to process
             the meta files to extract dependency information.

     _._M_A_K_E_._M_E_T_A_._I_G_N_O_R_E___F_I_L_T_E_R
             Provides a list of variable modifiers to apply to each pathname.
             Ignore if the expansion is an empty string.

     _._M_A_K_E_._M_E_T_A_._I_G_N_O_R_E___P_A_T_H_S
             Provides a list of path prefixes that should be ignored; because
             the contents are expected to change over time.  The default list
             includes: ‘_/_d_e_v _/_e_t_c _/_p_r_o_c _/_t_m_p _/_v_a_r_/_r_u_n _/_v_a_r_/_t_m_p’

     _._M_A_K_E_._M_E_T_A_._I_G_N_O_R_E___P_A_T_T_E_R_N_S
             Provides a list of patterns to match against pathnames.  Ignore
             any that match.

     _._M_A_K_E_._M_E_T_A_._P_R_E_F_I_X
             Defines the message printed for each meta file updated in “meta
             verbose” mode.  The default value is:
                   Building ${.TARGET:H:tA}/${.TARGET:T}

     _._M_A_K_E_._M_O_D_E
             Processed after reading all makefiles.  Affects the mode that
             mmaakkee runs in.  It can contain these keywords:

             ccoommppaatt  Like --BB, puts mmaakkee into “compat” mode.

             mmeettaa    Puts mmaakkee into “meta” mode, where meta files are created
                     for each target to capture the commands run, the output
                     generated, and if filemon(4) is available, the system
                     calls which are of interest to mmaakkee.  The captured output
                     can be useful when diagnosing errors.

                     mmaakkee will use the information in the meta file to help
                     determine if a target is out-of-date when the normal
                     dependency rules indicate it is not.

                     First, the commands to be executed, will be compared to
                     those captured previously, if any differ, the target is
                     out-of-date.

                     This allows for a huge improvement in the reliability and
                     efficiency of update builds.  It is no longer necessary
                     for targets to depend on makefiles just in-case they set
                     a variable that might be relevant.  Mechanisms such as
                     _._M_A_K_E_._M_E_T_A_._C_M_P___F_I_L_T_E_R and ..NNOOMMEETTAA__CCMMPP, allow limiting or
                     disabling that comparison on a per target basis.  A
                     reference to the variable _._O_O_D_A_T_E can be leveraged to
                     block comparison of certain commands.  For example:
                     ‘${.OODATE:M}’ will expand to nothing and have no impact
                     on the target, its side-effect though, will be to prevent
                     comparison of any command line it appears on.  For
                     documentation purposes ‘${.OODATE:MNOMETA_CMP}’ is
                     useful.

                     If necessary, mmaakkee will then use the information captured
                     by filemon(4), to check the modification time of any file
                     used in generating the target, if any is newer, the
                     target is out-of-date.

                     Such deep inspection can easily lead to cases where a
                     target is _a_l_w_a_y_s considered out-of-date, which is why
                     _._M_A_K_E_._M_E_T_A_._I_G_N_O_R_E___F_I_L_T_E_R, _._M_A_K_E_._M_E_T_A_._I_G_N_O_R_E___P_A_T_H_S and
                     _._M_A_K_E_._M_E_T_A_._I_G_N_O_R_E___P_A_T_T_E_R_N_S, are provided to limit that
                     inspection when necessary.

             ccuurrddiirrOOkk==_b_f
                     By default, mmaakkee does not create _._m_e_t_a files in
                     ‘_._C_U_R_D_I_R’.  This can be overridden by setting _b_f to a
                     value which represents true.

             mmiissssiinngg--mmeettaa==_b_f
                     If _b_f is true, a missing _._m_e_t_a file makes the target out-
                     of-date.

             mmiissssiinngg--ffiilleemmoonn==_b_f
                     If _b_f is true, missing filemon data makes the target out-
                     of-date.

             nnooffiilleemmoonn
                     Do not use filemon(4).

             eennvv     For debugging, it can be useful to include the
                     environment in the _._m_e_t_a file.

             vveerrbboossee
                     If in “meta” mode, print a clue about the target being
                     built.  This is useful if the build is otherwise running
                     silently.  The message printed is the expanded value of
                     _._M_A_K_E_._M_E_T_A_._P_R_E_F_I_X.

             iiggnnoorree--ccmmdd
                     Some makefiles have commands which are simply not stable.
                     This keyword causes them to be ignored for determining
                     whether a target is out of date in “meta” mode.  See also
                     ..NNOOMMEETTAA__CCMMPP.

             ssiilleenntt==_b_f
                     If _b_f is true, when a .meta file is created, mark the
                     target ..SSIILLEENNTT.

             rraannddoommiizzee--ttaarrggeettss
                     In both compat and parallel mode, do not make the targets
                     in the usual order, but instead randomize their order.
                     This mode can be used to detect undeclared dependencies
                     between files.

     _M_A_K_E_O_B_J_D_I_R
             Used to create files in a separate directory, see _._O_B_J_D_I_R.

     _M_A_K_E___O_B_J_D_I_R___C_H_E_C_K___W_R_I_T_A_B_L_E
             When true, mmaakkee will check that _._O_B_J_D_I_R is writable, and issue a
             warning if not.

     _M_A_K_E___D_E_B_U_G___O_B_J_D_I_R___C_H_E_C_K___W_R_I_T_A_B_L_E
             When true and mmaakkee is warning about an unwritable _._O_B_J_D_I_R, report
             the variables listed in _M_A_K_E___P_R_I_N_T___V_A_R___O_N___E_R_R_O_R to help debug.

     _M_A_K_E_O_B_J_D_I_R_P_R_E_F_I_X
             Used to create files in a separate directory, see _._O_B_J_D_I_R.  It
             should be an absolute path.

     _._M_A_K_E_._O_S
             The name of the operating system, see uname(1).  It is read-only.

     _._M_A_K_E_O_V_E_R_R_I_D_E_S
             This variable is used to record the names of variables assigned
             to on the command line, so that they may be exported as part of
             ‘MAKEFLAGS’.  This behavior can be disabled by assigning an empty
             value to ‘_._M_A_K_E_O_V_E_R_R_I_D_E_S’ within a makefile.  Extra variables can
             be exported from a makefile by appending their names to
             ‘_._M_A_K_E_O_V_E_R_R_I_D_E_S’.  ‘MAKEFLAGS’ is re-exported whenever
             ‘_._M_A_K_E_O_V_E_R_R_I_D_E_S’ is modified.

     _._M_A_K_E_._P_A_T_H___F_I_L_E_M_O_N
             If mmaakkee was built with filemon(4) support, this is set to the
             path of the device node.  This allows makefiles to test for this
             support.

     _._M_A_K_E_._P_I_D
             The process ID of mmaakkee.  It is read-only.

     _._M_A_K_E_._P_P_I_D
             The parent process ID of mmaakkee.  It is read-only.

     _M_A_K_E___P_R_I_N_T___V_A_R___O_N___E_R_R_O_R
             When mmaakkee stops due to an error, it sets ‘_._E_R_R_O_R___T_A_R_G_E_T’ to the
             name of the target that failed, ‘_._E_R_R_O_R___E_X_I_T’ to the exit status
             of the failed target, ‘_._E_R_R_O_R___C_M_D’ to the commands of the failed
             target, and in “meta” mode, it also sets ‘_._E_R_R_O_R___C_W_D’ to the
             getcwd(3), and ‘_._E_R_R_O_R___M_E_T_A___F_I_L_E’ to the path of the meta file
             (if any) describing the failed target.  It then prints its name
             and the value of ‘_._C_U_R_D_I_R’ as well as the value of any variables
             named in ‘_M_A_K_E___P_R_I_N_T___V_A_R___O_N___E_R_R_O_R’.

     _._M_A_K_E_._S_A_V_E___D_O_L_L_A_R_S
             If true, ‘$$’ are preserved when doing ‘:=’ assignments.  The
             default is false, for backwards compatibility.  Set to true for
             compatability with other makes.  If set to false, ‘$$’ becomes
             ‘$’ per normal evaluation rules.

     _._M_A_K_E_._T_A_R_G_E_T___L_O_C_A_L___V_A_R_I_A_B_L_E_S
             If set to ‘false’, apparent variable assignments in dependency
             lines are treated as normal sources.

     _._M_A_K_E_._U_I_D
             The numeric ID of the user running mmaakkee.  It is read-only.

     _._n_e_w_l_i_n_e
             This variable is simply assigned a newline character as its
             value.  It is read-only.  This allows expansions using the ::@@
             modifier to put a newline between iterations of the loop rather
             than a space.  For example, in case of an error, mmaakkee prints the
             variable names and their values using:
                   ${MAKE_PRINT_VAR_ON_ERROR:@v@$v='${$v}'${.newline}@}

     _._O_B_J_D_I_R
             A path to the directory where the targets are built.  Its value
             is determined by trying to chdir(2) to the following directories
             in order and using the first match:

             1.   $${{MMAAKKEEOOBBJJDDIIRRPPRREEFFIIXX}}$${{..CCUURRDDIIRR}}

                  (Only if ‘MAKEOBJDIRPREFIX’ is set in the environment or on
                  the command line.)

             2.   $${{MMAAKKEEOOBBJJDDIIRR}}

                  (Only if ‘MAKEOBJDIR’ is set in the environment or on the
                  command line.)

             3.   $${{..CCUURRDDIIRR}}_/_o_b_j_.$${{MMAACCHHIINNEE}}

             4.   $${{..CCUURRDDIIRR}}_/_o_b_j

             5.   _/_u_s_r_/_o_b_j_/$${{..CCUURRDDIIRR}}

             6.   $${{..CCUURRDDIIRR}}

             Variable expansion is performed on the value before it is used,
             so expressions such as $${{..CCUURRDDIIRR::SS,,^^//uussrr//ssrrcc,,//vvaarr//oobbjj,,}} may be
             used.  This is especially useful with ‘MAKEOBJDIR’.

             ‘_._O_B_J_D_I_R’ may be modified in the makefile via the special target
             ‘..OOBBJJDDIIRR’.  In all cases, mmaakkee changes to the specified directory
             if it exists, and sets ‘_._O_B_J_D_I_R’ and ‘_P_W_D’ to that directory
             before executing any targets.

             Except in the case of an explicit ‘..OOBBJJDDIIRR’ target, mmaakkee checks
             that the specified directory is writable and ignores it if not.
             This check can be skipped by setting the environment variable
             ‘MAKE_OBJDIR_CHECK_WRITABLE’ to “no”.

     _._P_A_R_S_E_D_I_R
             The directory name of the current makefile being parsed.

     _._P_A_R_S_E_F_I_L_E
             The basename of the current makefile being parsed.  This variable
             and ‘_._P_A_R_S_E_D_I_R’ are both set only while the makefiles are being
             parsed.  To retain their current values, assign them to a
             variable using assignment with expansion ‘::==’.

     _._P_A_T_H   The space-separated list of directories that mmaakkee searches for
             files.  To update this search list, use the special target
             ‘..PPAATTHH’ rather than modifying the variable directly.

     _%_P_O_S_I_X  Is set in POSIX mode, see the special ‘_._P_O_S_I_X’ target.

     _P_W_D     Alternate path to the current directory.  mmaakkee normally sets
             ‘_._C_U_R_D_I_R’ to the canonical path given by getcwd(3).  However, if
             the environment variable ‘PWD’ is set and gives a path to the
             current directory, mmaakkee sets ‘_._C_U_R_D_I_R’ to the value of ‘PWD’
             instead.  This behavior is disabled if ‘MAKEOBJDIRPREFIX’ is set
             or ‘MAKEOBJDIR’ contains a variable transform.  ‘_P_W_D’ is set to
             the value of ‘_._O_B_J_D_I_R’ for all programs which mmaakkee executes.

     _._S_H_E_L_L  The pathname of the shell used to run target scripts.  It is
             read-only.

     _._S_U_F_F_I_X_E_S
             The list of known suffixes.  It is read-only.

     _._S_Y_S_P_A_T_H
             The space-separated list of directories that mmaakkee searches for
             makefiles, referred to as the system include path.  To update
             this search list, use the special target ‘..SSYYSSPPAATTHH’ rather than
             modifying the variable which is read-only.

     _._T_A_R_G_E_T_S
             The list of targets explicitly specified on the command line, if
             any.

     _V_P_A_T_H   The colon-separated (“:”) list of directories that mmaakkee searches
             for files.  This variable is supported for compatibility with old
             make programs only, use ‘_._P_A_T_H’ instead.

   VVaarriiaabbllee mmooddiiffiieerrss
     The general format of a variable expansion is:

           $${{_v_a_r_i_a_b_l_e[::_m_o_d_i_f_i_e_r[::...]]}}

     Each modifier begins with a colon.  To escape a colon, precede it with a
     backslash ‘\’.

     A list of indirect modifiers can be specified via a variable, as follows:

           _m_o_d_i_f_i_e_r___v_a_r_i_a_b_l_e = _m_o_d_i_f_i_e_r[::...]

           $${{_v_a_r_i_a_b_l_e::$${{_m_o_d_i_f_i_e_r___v_a_r_i_a_b_l_e}}[::...]}}

     In this case, the first modifier in the _m_o_d_i_f_i_e_r___v_a_r_i_a_b_l_e does not start
     with a colon, since that colon already occurs in the referencing
     variable.  If any of the modifiers in the _m_o_d_i_f_i_e_r___v_a_r_i_a_b_l_e contains a
     dollar sign (‘$’), these must be doubled to avoid early expansion.

     Some modifiers interpret the expression value as a single string, others
     treat the expression value as a whitespace-separated list of words.  When
     splitting a string into words, whitespace can be escaped using double
     quotes, single quotes and backslashes, like in the shell.  The quotes and
     backslashes are retained in the words.

     The supported modifiers are:

     ::EE   Replaces each word with its suffix.

     ::HH   Replaces each word with its dirname.

     ::MM_p_a_t_t_e_r_n
          Selects only those words that match _p_a_t_t_e_r_n.  The standard shell
          wildcard characters (‘*’, ‘?’, and ‘[]’) may be used.  The wildcard
          characters may be escaped with a backslash (‘\’).  As a consequence
          of the way values are split into words, matched, and then joined,
          the construct ‘${VAR:M*}’ removes all leading and trailing
          whitespace and normalizes the inter-word spacing to a single space.

     ::NN_p_a_t_t_e_r_n
          This is the opposite of ‘::MM’, selecting all words which do _n_o_t match
          _p_a_t_t_e_r_n.

     ::OO   Orders the words lexicographically.

     ::OOnn  Orders the words numerically.  A number followed by one of ‘k’, ‘M’
          or ‘G’ is multiplied by the appropriate factor, which is 1024 for
          ‘k’, 1048576 for ‘M’, or 1073741824 for ‘G’.  Both upper- and lower-
          case letters are accepted.

     ::OOrr  Orders the words in reverse lexicographical order.

     ::OOrrnn
          Orders the words in reverse numerical order.

     ::OOxx  Shuffles the words.  The results are different each time you are
          referring to the modified variable; use the assignment with
          expansion ‘::==’ to prevent such behavior.  For example,

                LIST=                   uno due tre quattro
                RANDOM_LIST=            ${LIST:Ox}
                STATIC_RANDOM_LIST:=    ${LIST:Ox}

                all:
                        @echo "${RANDOM_LIST}"
                        @echo "${RANDOM_LIST}"
                        @echo "${STATIC_RANDOM_LIST}"
                        @echo "${STATIC_RANDOM_LIST}"
          may produce output similar to:

                quattro due tre uno
                tre due quattro uno
                due uno quattro tre
                due uno quattro tre

     ::QQ   Quotes every shell meta-character in the value, so that it can be
          passed safely to the shell.

     ::qq   Quotes every shell meta-character in the value, and also doubles ‘$’
          characters so that it can be passed safely through recursive
          invocations of mmaakkee.  This is equivalent to ‘::SS//\\$$//&&&&//gg::QQ’.

     ::RR   Replaces each word with everything but its suffix.

     ::rraannggee[==_c_o_u_n_t]
          The value is an integer sequence representing the words of the
          original value, or the supplied _c_o_u_n_t.

     ::ggmmttiimmee[==_t_i_m_e_s_t_a_m_p]
          The value is interpreted as a format string for strftime(3), using
          gmtime(3), producing the formatted timestamp.  Note: the ‘%s’ format
          should only be used with ‘::llooccaallttiimmee’.  If a _t_i_m_e_s_t_a_m_p value is not
          provided or is 0, the current time is used.

     ::hhaasshh
          Computes a 32-bit hash of the value and encodes it as 8 hex digits.

     ::llooccaallttiimmee[==_t_i_m_e_s_t_a_m_p]
          The value is interpreted as a format string for strftime(3), using
          localtime(3), producing the formatted timestamp.  If a _t_i_m_e_s_t_a_m_p
          value is not provided or is 0, the current time is used.

     ::mmttiimmee[==_t_i_m_e_s_t_a_m_p]
          Call stat(2) with each word as pathname; use ‘st_mtime’ as the new
          value.  If stat(2) fails; use _t_i_m_e_s_t_a_m_p or current time.  If
          _t_i_m_e_s_t_a_m_p is set to ‘error’, then stat(2) failure will cause an
          error.

     ::ttAA  Attempts to convert the value to an absolute path using realpath(3).
          If that fails, the value is unchanged.

     ::ttll  Converts the value to lower-case letters.

     ::ttss_c
          When joining the words after a modifier that treats the value as
          words, the words are normally separated by a space.  This modifier
          changes the separator to the character _c.  If _c is omitted, no
          separator is used.  The common escapes (including octal numeric
          codes) work as expected.

     ::tttt  Converts the first character of each word to upper-case, and the
          rest to lower-case letters.

     ::ttuu  Converts the value to upper-case letters.

     ::ttWW  Causes subsequent modifiers to treat the value as a single word
          (possibly containing embedded whitespace).  See also ‘::[[**]]’.

     ::ttww  Causes the value to be treated as a list of words.  See also ‘::[[@@]]’.

     ::SS/_o_l_d___s_t_r_i_n_g/_n_e_w___s_t_r_i_n_g/[11ggWW]
          Modifies the first occurrence of _o_l_d___s_t_r_i_n_g in each word of the
          value, replacing it with _n_e_w___s_t_r_i_n_g.  If a ‘g’ is appended to the
          last delimiter of the pattern, all occurrences in each word are
          replaced.  If a ‘1’ is appended to the last delimiter of the
          pattern, only the first occurrence is affected.  If a ‘W’ is
          appended to the last delimiter of the pattern, the value is treated
          as a single word.  If _o_l_d___s_t_r_i_n_g begins with a caret (‘^’),
          _o_l_d___s_t_r_i_n_g is anchored at the beginning of each word.  If _o_l_d___s_t_r_i_n_g
          ends with a dollar sign (‘$’), it is anchored at the end of each
          word.  Inside _n_e_w___s_