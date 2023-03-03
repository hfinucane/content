# platform = multi_platform_sle
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low

{{{ bash_instantiate_variables("var_accounts_password_warn_age_login_defs") }}}

{{% call iterate_over_command_output("i", "awk -v var=\"$var_accounts_password_warn_age_login_defs\" -F: '$6 < var || $6 == \"\" {print $1}' /etc/shadow") -%}}
chage --warndays $var_accounts_password_warn_age_login_defs $i
{{%- endcall %}}
