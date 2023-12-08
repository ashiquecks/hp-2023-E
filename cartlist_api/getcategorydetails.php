<?php
include "connection.php";


$sql="select * from product_details";
$result=mysqli_query($con,$sql);
$count=mysqli_num_rows($result);
if($count>0)
{
    $response["details"] = array();
    $reg_details = array();
    while ($row = mysqli_fetch_array($result))
    {


        array_push($reg_details,
            array('number' => $row[0],  
                'product_id'=>$row[1],        
                'category'=>$row[4],        
                'sub_category'=>$row[5],
                'category_image'=>$row[6],    
            ));
    }


    echo json_encode($reg_details);
}
else
{
    $response["error"] = true;
    $response["message"] = "failed";
    echo json_encode($response);
}


?>