# JAMF-DSE-CheckAndInstall
 A Jamf script to check to see if a file/application, etc is installed and if not install it.
- Author: Andrew W. Johnson
- Date: Sometime in 2020
- Version: 1.00
- Organization: Stony Brook University/DoIT
---
### Description

This Jamf script will check to see if a file is installed. If it is not it will then try to run the Jamf install policy using a trigger/custom event or policy ID. It relies on the path to the file to be passed in the fourth parameter/argument, and the policy trigger/ ID passed in the fifth parameter/argument.