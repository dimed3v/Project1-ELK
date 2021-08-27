#!/bin/bash/

echo "A quick system audit script: $(date)"
echo "machine type info:"
echo $MACHTYPE
echo -e "Uname info: $(uname -a) \n"
echo -e "IP INFO: $(hostname -I) \n"
