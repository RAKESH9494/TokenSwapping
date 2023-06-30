import React, { useEffect, useState} from 'react';
import { ethers } from 'ethers'
import './Styles.css';
const Home = (props) => {
  const [totalSuply,setTotalSuply] = useState(0);
  const [AccountBalace,setAccountBalance] = useState(0); 
  useEffect(()=>{
    const getData = async(e)=>{
      try{
        const Data = await props.contract.getTotalSupply();
        const Data2=await props.contract.getBalance(props.Account);
        setAccountBalance(Data2.toString());
        setTotalSuply(Data.toString());
      }catch(e){
        console.log(e);
      }
    }
    props.contract && getData()
  },[props.contract])
const submithandler = async(e)=>{
  e.preventDefault();
  const v = document.querySelector("#data").value;
  try{
    const amount ={value : ethers.utils.parseEther(v)}
    const transaction = await props.contract.deposit(amount);
    await transaction.wait()
    alert("Depost successfull")
  }catch(e){
    alert(e.message);
    console.log(e);
  }
}

  return (
    <div>
      <div className="header">
        <a href="#deftault" className="logo">DeFi</a>
        <div className="header-right">
          <a>CONNECTED : {props.account}</a>
        </div>
      </div>
      <div className="outer">
        <center><div class="results_in">
          <span>Total Supply : {totalSuply}</span><br/><br/>
          <span>Your Balance : {AccountBalace} nUSD</span>
        </div></center><center>
        <div className="Productitem">
           <div className="productbody">
             <form class="form-group" onSubmit={submithandler}>
                <input type="text" class="form-control" placeholder='Enter Here' id="data" required/><br/>
                <input type="submit" value={"DEPOSIT(ETH)"} class="btn btn-secondary"/>&nbsp;&nbsp;
                <input type="submit" value={"REEDEM(nUSD)"} class="btn btn-secondary"/>
             </form>
              </div>
            </div>
        </center>
      </div> 
    </div>
  );
};
export default (Home);

