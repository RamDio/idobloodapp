<?php
include 'conn.php';

//flag 1 for login
//flag 2 for update register


//flag to check and to execute specific switch case based on flag value sent
$flag = $_POST['flag'];
(int) $flag;


switch ($flag) {
    
    case 1:
        	//assigning data sent to $Email which can be either email or mobile no in return we'll be sending email only
        	$Username = $_POST['username'];
        	$Password = md5($_POST['password']);
        	$fcm_token = $_POST['fcm_token'];
        
        	//creating a query
        	$query = "SELECT * FROM tbluser WHERE (Username='$Username' OR Mobile='$Username') AND Password = '$Password' AND status=1 ";
        	$result = mysqli_query($connect, $query);
            
        
            if($result->num_rows>0){
    		    
        		while ($row = mysqli_fetch_assoc($result)) {
                    //Update FCM Token
                	$query2 = "UPDATE `tbluser` SET `fcm_token`='$fcm_token' WHERE `id`='".$row['id']."' ";
                	$result2 = mysqli_query($connect, $query2);
        
        			$json['value'] = 1;
        			$json['message'] = 'User Successfully LoggedIn';
        			$json['username'] = $row['Username'];
        			$json['firstname'] = $row['Firstname'];
        			$json['id'] = $row['id'];
        			$json['status'] = 'success';
        
        		}
    		    
    			
    		}else{
        
        			$json['value'] = 0;
        			$json['message'] = 'Failed to LogIn';
        			$json['username'] = '';
        			$json['firstname'] = '';
        			$json['id'] = '';
        			$json['status'] = 'failure';
    
    		}
    // 		echo json_encode($json);
    // 		mysqli_close($connect);
            
            break;
            //Ends case 1
    
    case 2:
			 $Firstame = $_POST['firstname'];
			 $LastName = $_POST['lastname'];
             $Username = $_POST['username'];
			 $Mobile = $_POST['mobile'];
			 $Bloodtype=$_POST['bloodtype'];
			 $Address=$_POST['address'];
             $Password = md5($_POST['password']);
             $fcm_token = $_POST['fcm_token'];
    	
    		 $sqlmax = "SELECT max(id) FROM `tbluser`";
    	     $resultmax = mysqli_query($connect, $sqlmax);
    	     $rowmax = mysqli_fetch_array($resultmax);
    	     
    	     if($rowmax[0]==null){
    	          $idnomax=1;
    	     }else{
    	          $idnomax=$rowmax[0]+1;
    	     }
        
            $query = "SELECT * FROM tbluser WHERE Username='$Username'";
        	$result = mysqli_query($connect, $query);
        	
    		if(mysqli_num_rows($result)>0){
    			$json['value'] = 2;
    			$json['message'] = ' Username Already Used: ' .$Username;
    			
    		}else{
    			$query = "INSERT INTO tbluser (id, FirstName,Lastname, Username,Address, Bloodtype,Mobile, Password, fcm_token, status) VALUES ('$idnomax','$Firstame','$Lastname','$Username','$Address','$Bloodtype','$Mobile','$Password','$fcm_token', 1)";
    			$inserted = mysqli_query($connect, $query);
    			
    			if($inserted == 1 ){    			
    			    
    				$json['value'] = 1;
    				$json['message'] = 'User Successfully Registered';
    			}else{
    				$json['value'] = 0;
    				$json['message'] = 'User Registration Failed';
    			}

      		}
      		
    //   		echo json_encode($json);
    // 		mysqli_close($connect);
            
            break;
            //Ends case 2
    
    default:
        $inserted == 0;
}    
        
	echo json_encode($json);
	mysqli_close($connect);

?>