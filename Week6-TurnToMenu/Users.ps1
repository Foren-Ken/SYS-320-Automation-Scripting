

<# ******************************
# Create a function that returns a list of NAMEs AND SIDs only for enabled users
****************************** #>
function getEnabledUsers(){

  $enabledUsers = Get-LocalUser | Where-Object { $_.Enabled -ilike "True" } | Select-Object Name, SID
  return $enabledUsers

}



<# ******************************
# Create a function that returns a list of NAMEs AND SIDs only for not enabled users
****************************** #>
function getNotEnabledUsers(){

  $notEnabledUsers = Get-LocalUser | Where-Object { $_.Enabled -ilike "False" } | Select-Object Name, SID
  return $notEnabledUsers

}




<# ******************************
# Create a function that adds a user
****************************** #>
function createAUser($name, $password){

   $params = @{
     Name = $name
     Password = $password
   }

   $newUser = New-LocalUser @params 


   # ***** Policies ******

   # User should be forced to change password
   Set-LocalUser $newUser -PasswordNeverExpires $false

   # First time created users should be disabled
   Disable-LocalUser $newUser

}



function removeAUser($name){
   
   $userToBeDeleted = Get-LocalUser | Where-Object { $_.name -ilike $name }
   Remove-LocalUser $userToBeDeleted
   
}



function disableAUser($name){
   
   $userToBeDeleted = Get-LocalUser | Where-Object { $_.name -ilike $name }
   Disable-LocalUser $userToBeDeleted
   
}


function enableAUser($name){
   
   $userToBeEnabled = Get-LocalUser | Where-Object { $_.name -ilike $name }
   Enable-LocalUser $userToBeEnabled
   
}

<#
Script to check if a user exists
#>
function checkUser($userName){
$exists = Get-LocalUser -Name $userName -ErrorAction SilentlyContinue
if ($exists){
    return $true
    }
else {
    return $false
    }
}
<#

Check quality of password

#>
function checkPass($password){
        $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
        $plainpass = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
        
        $hasANum = $plainpass -match '\d'
        $hasALet = $plainpass -match '[a-zA-Z]'
        $hasASym = $plainpass -match '[^a-zA-Z0-9]'
        $has8Cha = $false
        if ($plainpass.Length -cge 6) {$has8Cha = $true}
        
        if ($hasANum -and $hasALet -and $hasASym -and $has8Cha) {
        
        return $true

        }

        else {
        return $false
        }
        }
