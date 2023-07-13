import { Password } from '@mui/icons-material';
import { Typography, Grid, Paper,  Button } from '@mui/material';
import { TextField, MenuItem } from '@mui/material';
import React, { useState } from 'react';
import axios from 'axios';
import {useNavigate} from 'react-router-dom'
import {  FormControlLabel, Checkbox } from '@mui/material';
import {  Link,  } from 'react-router-dom';

import ArrowDropDownIcon from '@mui/icons-material/ArrowDropDown';
const Login = () => {
  const navigate = useNavigate();
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const { data: res } = await axios.post(`http://localhost:5000/Login/Login1`, { Email,Password});
      // Handle response from the backend
      console.log(res);
      localStorage.setItem("token", res.data);
      navigate('/Welcome')
    } catch (error) {
      console.error(error);
    }
  
  };
  
    const [Email, setEmail] = useState('');
    const [Password, setPassword] = useState('');
  
  return (
    <div>
     <Grid container lg={12} justifyContent="center" alignItems="center" sx={{ backgroundColor: '#007F85', height: '750px' }}>
 
 
    <Paper sx={{ width: '478px', height: '400px', borderRadius: '26px', justifyContent: 'center', display: 'flex', alignItems: 'center' }}>
      <Grid container lg={12} justifyContent="center" alignItems="center">
        <Grid item lg={10} sx={{ textAlign: 'center' ,}}>
          <Typography sx={{ fontSize: '26px', fontFamily: 'Inter', fontWeight: '600', marginTop: '10px' }}>Login</Typography>
        </Grid>
        <Grid item lg={10} sx={{ textAlign: 'center' }}>
          <Typography sx={{ fontSize: '12px', fontFamily: 'Inter', fontWeight: '400' }}>Discover the next best seller before it hits the shelves!</Typography>
        </Grid>
    
        <Grid item lg={10}  sx={{marginTop:'20px'}}>
          <Typography sx={{ textAlign: 'left', fontSize: '16px', fontWeight: '700', fontFamily: 'Inter' }}>Email</Typography>
          <TextField
            required
            fullWidth
            variant="outlined"
            placeholder="Enter your email"
            value={Email}
            size="small"
            onChange={(e) => setEmail(e.target.value)}
            sx={{ mb: 2, borderRadius: '6px', backgroundColor: '#F4F1F1' }}
          />
        </Grid>
        <Grid item lg={10} >
          <Typography sx={{ textAlign: 'left', fontSize: '16px', fontWeight: '700', fontFamily: 'Inter' }}>New Password</Typography>
          <TextField
            required
            fullWidth
            variant="outlined"
            placeholder="Enter password"
            value={Password}
            size="small"
            onChange={(e) => setPassword(e.target.value)}
            sx={{ mb: 0, borderRadius: '6px', backgroundColor: '#F4F1F1' }}
          />
        </Grid>
       
        
        
        <Grid item lg={10} sx={{textAlign:'right'}} >
<Button

  sx={{
    mt: 0,
    mb: 2,
  
    borderRadius: '12px',
    textTransform: 'none',

    fontSize: '12px',
    fontFamily:'Inter',
    fontWeight:'400',color:'#007F85'
  }}
  component={Link}  
      to="/Forgot" 
>
Forgot Password?
</Button>
</Grid>

<Grid item lg={10} >

        <Button onClick={handleSubmit}
          type="submit"
          variant="contained"
          sx={{
            mt: 0,
            mb: 0,
            background: '#007F85',
            borderRadius: '12px',
            textTransform: 'none',
            width: '400px',
            height: '56px',
            fontSize: '20px',
            fontFamily: 'Inter',
            fontWeight: '500'
          }}
        >
          Submit
        </Button>
     
        </Grid>
         </Grid>
        
    </Paper>
   
</Grid>

    </div>
  );
};

export default Login;
