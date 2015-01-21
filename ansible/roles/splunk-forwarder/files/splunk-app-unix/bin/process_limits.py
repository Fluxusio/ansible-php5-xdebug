#!/usr/bin/env python

import re
import sys
import commands
import fileinput

print "process_name,pid,limit,soft_limit,hard_limit,current_val,units"

for process in sys.argv[1:]:
    """Get PID of process we're interested in"""
    pid = commands.getoutput("cat /var/run/%s.pid 2>/dev/null" % process)

    if pid:
        stats = commands.getoutput("cat /proc/%s/stat 2>/dev/null" % pid).split(" ")
        cat_limits_output = commands.getoutput("cat /proc/%s/limits 2>/dev/null" % pid)

        """Process and output process limits data"""
        for line in cat_limits_output.splitlines()[1:]:
            split_vals = re.split('\s+', line)
            if split_vals[len(split_vals)-1] == '':
                split_vals.pop()

            if split_vals[2] == "priority":
                value_cols = 2
            else:
                value_cols = 3

            limit_name = " ".join(split_vals[0:len(split_vals) - value_cols])
            soft_limit = split_vals[len(split_vals) - 3]
            hard_limit = split_vals[len(split_vals) - 2]
            units = split_vals[len(split_vals) - 1]

            if limit_name == "Max cpu time":
                current_val = stats[15] + stats[16]
            elif limit_name == "Max open files":
                current_val = commands.getoutput("find /proc/%s/fd | wc -l 2>/dev/null" % pid)
            elif limit_name == "Max nice":
                current_val = stats[17]
            else:
                current_val = ""

            print "\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"" % (process, pid, limit_name, soft_limit, hard_limit, current_val, units)
