#!/bin/sh                                                                                                
# Copyright 2005-2011 Splunk, Inc.                                                                       
#                                                                                                        
#   Licensed under the Apache License, Version 2.0 (the "License");                                      
#   you may not use this file except in compliance with the License.                                     
#   You may obtain a copy of the License at                                                              
#                                                                                                        
#       http://www.apache.org/licenses/LICENSE-2.0                                                       
#                                                                                                        
#   Unless required by applicable law or agreed to in writing, software                                  
#   distributed under the License is distributed on an "AS IS" BASIS,                                    
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                             
#   See the License for the specific language governing permissions and                                  
#   limitations under the License.      

. `dirname $0`/common.sh

HEADER='Filesystem                                          Type              Inodes        IUsed       IFree      IUsePct    MountedOn'
HEADERIZE='{if (NR==1) {$0 = header}}'
PRINTF='{printf "%-50s  %-10s  %10s  %10s  %10s  %10s    %s\n", $1, $2, $3, $4, $5, $6, $7}'

if [ "x$KERNEL" = "xLinux" ] ; then
	assertHaveCommand df
	CMD='df -TPi'
	FILTER_POST='($2 ~ /^(tmpfs)$/) {next}'
fi

$CMD | tee $TEE_DEST | $AWK "$HEADERIZE $FILTER_PRE $MAP_FS_TO_TYPE $FORMAT $FILTER_POST $NORMALIZE $PRINTF"  header="$HEADER"
echo "Cmd = [$CMD];  | $AWK '$HEADERIZE $FILTER_PRE $MAP_FS_TO_TYPE $FORMAT $FILTER_POST $NORMALIZE $PRINTF' header=\"$HEADER\"" >> $TEE_DEST
