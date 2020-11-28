<template>
    <div id="sun">
        <div class="sun-header-background-img"></div>
        <div class="sun-header">
                <div class="sun-header-content">
                    <div class="sun-header-img">
                        <img src="../src/assets/1.png">
                    </div>
                    <div class="sun-header-menu">
                        <ul class="sun-header-menu-menu">
                            <li><div class="sun-header-menu-menu-hover" @click="sunActive = true, faqsActive = false, voteActive = false" :class="{menucheck: sunActive}" >SUN</div></li>
                            <li><div class="sun-header-menu-menu-hover" @click="sunActive = false, faqsActive = false, voteActive = true, voteItems= 0" :class="{menucheck: voteActive}" >Vote</div></li>
                            <li><div class="sun-header-menu-menu-hover" @click="sunActive = false, faqsActive = true, voteActive = false" :class="{menucheck: faqsActive}">FAQs</div></li>
                            <li> 
                                <div class="dropdown">Learn
                                    <div class="dropdown-content">
                                    <a href="#">WhitePaper</a>
                                    <a href="#">Audit</a>
                                    </div>
                              </div>
                            </li>
                        </ul>
                    </div>
                    <div class="sun-header-connect">
                          <div v-if="addressId!=''" class="sun-header-connect-wallet-connect">
                            <img src="../src/assets/tronConnect.png">
                            <span>{{addressId}}</span>
                            </div>
                          <div v-else class="sun-header-connect-wallet-unconnect">Connect To Wallet</div>
                        <div class="sun-header-connect-translate">
                            <select class="sun-header-connect-translate-select">
                                <option>English</option>
                                <option>简体中文</option>
                            </select>
                        </div>
                    </div>
                </div>
        </div>
        <div class="sun-body" v-if="sunActive">
            <div class="sun-body-content">
                <h1>Today's a good day to sow SUN</h1>
                <h2>Stake to mine and earn SUN</h2>
                <h3>SUN smart contract has been verified by SlowMist. Check out the audit report <a href="#">here</a>.</h3>
                <div class="sun-body-content-box">
                    <div v-if="xCheck" class="sun-body-content-warning">
                        <div>Currently we only support staking through this page. Assets that are staked via other means will not be included in Official mining and cannot be returned.</div>
                        <div class="sun-body-content-warning-x " @click="xCheck= false">+</div>
                    </div>
                    <div class="sun-body-content-box1">
                        <div class="sun-body-content-box1-1">
                            <img src="../src/assets/svg.png">
                            <span>Total Staked Value</span>
                            <span><a href="#">Mining rules</a></span>
                        </div>
                        <div class="sun-body-content-box1-2">
                            <p class="sun-body-content-box1-2-p1">≈ <span>{{balanceOfTrx}} </span> TRX</p>
                            <p class="sun-body-content-box1-2-p2">≈ 199,013,590 USD</p>
                               
                        </div>
                    </div>
                    <div class="sun-body-content-box2">
                        <a href="#">Get LP Token on JustSwap<span> ?</span></a>
                    </div>
                </div>
            </div>
            <div class="sun-body-BODY">
                <div class="sun-body-BODY-head">
                    <span><span class="sun-body-BODY-head-hover" @click="activeCheck = true" :class="{tim: activeCheck, xam: !activeCheck}">Active </span></span><span>|</span><span><span class="sun-body-BODY-head-hover" @click=" activeCheck = false, endedCheck" :class="{tim: !activeCheck, xam: activeCheck}"> Ended</span></span>
                </div>
                <div v-if="activeCheck">
                    <div class="sun-body-BODY-items">

                        <div class="sun__item">
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/sunlogo.png" class="logo1">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2" @click="sunTron =true,getBalanceOfStake(),getBalanceOfToken(), thaydoibody(),magiaodich='https://shasta.tronscan.org/#/transaction/'">select</p>
                            </div>
                        </div>
                        <div class="sun__item">
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/ulogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2" @click="uTron= true">select</p>
                            </div>
                        </div>
                        <div class="sun__item">
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/tlogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2" @click="tTron= true">select</p>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="sun-body-BODY-items">
    
                        <div class="sun__item">
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/sunlogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2">select</p>
                            </div>
                        </div>
                        <div class="sun__item">
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/sunlogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2">select</p>
                            </div>
                        </div>
                        <div class="sun__item">
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/sunlogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2">select</p>
                            </div>
                        </div>
                    </div>
                    <div class="sun-body-BODY-items">
    
                        <div class="sun__item">
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/sunlogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2">select</p>
                            </div>
                        </div>
                        <div class="sun__item">
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/sunlogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2">select</p>
                            </div>
                        </div>
                    </div> -->
                </div>
                <div v-else>
                    <div class="sun-body-BODY-items">

                        <div class="sun__item">
                            <div class="trapezoid">Ended</div>
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/sunlogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2">select</p>
                            </div>
                        </div>
                        <div class="sun__item">
                            <div class="trapezoid">Ended</div>
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/ulogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2">select</p>
                            </div>
                        </div>
                        <div class="sun__item">
                            <div class="trapezoid">Ended</div>
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/sunlogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2">select</p>
                            </div>
                        </div>
                    </div>
                    <div class="sun-body-BODY-items">
    
                        <div class="sun__item">
                            <div class="trapezoid">Ended</div>
                            <div class="sun__item-header">
                                <div class="sun__item-header-img">
                                    <img src="../src/assets/sunlogo.png" class="logo1">
                                    <img src="../src/assets/tronlogo.png" class="logo2">
                                </div>
                                <div class="sun__item-header-conten">
                                    <p>SUN/TRX LP Pool</p>
                                    <span class="sun__item-header-conten-phu">Stake SUN/TRX LP Earn <span class="sun__item-header-conten-phu-phu">9</span><span class="sun__item-header-conten-phu-phu">x</span> SUN</span>
                                </div>
                            </div>
                            <div class="sun__item-body">
                                <div class="sun__item-body1">
                                    <span>Total:54,388,917,234</span>
                                    <span class="sun__item-body1-phu">>APY: 37.25%</span>
                                </div>
                                <div class="sun__item-body2">
                                    <p class="sun__item-tokuchou">Total Staked</p>
                                    <div class="sun__item-body2-item">
                                        <span>1,757,981</span>
                                        <span>SUN</span>
                                    </div>
                                    <div class="sun__item-body2-item">
                                        <span>555,126,738</span>
                                        <span>TRX</span>
                                    </div>
                                    <p class="sun__item-tokuchou">Pool Supply</p>
                                    <div class="sun__item-body2-item">
                                        <span>22,814</span>
                                        <span>SUN</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sun__item-footer">
                                <a href="#"><p class="sun__item-footer1">Get LP Token</p></a>
                                <p class="sun__item-footer2">select</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="stake-sunTron" v-if="sunTron== true">
        <div class="stake-body">
           <div class="stake-sunTron-content">
               <div class="stake-sunTron-exit" @click="sunTron= false,thaydoibody()">+</div>
           <div>
                <div class="stake-sunTron-header"><span class="stake-sunTron-header-stake" @click="sunTronStake=true" :class="{stakesunTronheaderhover : sunTronStake}">Stake</span><span class="stake-sunTron-header-claim"  @click="sunTronStake=false" :class="{stakesunTronheaderhover: !sunTronStake}">Claim</span></div><br/>
            <div v-if="sunTronStake==true" class="stake-sunTron-body">
                <div class="stake-sunTron-body1">
                    <p>My Stake</p>
                    <div class="stake-sunTron-input1"><div class="stake-sunTron-input1-1">{{balanceStake}}</div></div>
                </div>
                <div class="stake-sunTron-body2">
                    <p>Stake SUN<span @click="getMaxToken()">MAX</span></p>
                    <input class="stake-sunTron-input2" v-model="sotienstake" placeholder="0">
                    <p class="stake-sunTron-body2-footer">Maximum Stake:{{balanceToken}} SUN</p>
                </div>
                <div class="stake-sunTron-footer" @click="stakeToken()">
                    Stake
                </div>
            </div>
            <div v-else class="stake-sunTron-body">
                <div class="stake-sunTron-body1">
                    <p>Pending Claim<span @click="claimWithDraw()">Claim</span></p>
                    <p class="stake-sunTron-input1"></p>
                </div>
                <div class="stake-sunTron-body2">
                    <p>Staked<span @click="sotienUnstake = balanceStake">MAX</span></p>
                    <input class="stake-sunTron-input2" v-model="sotienUnstake" placeholder="0">
                    <p class="stake-sunTron-body2-footer">Maximum Amount: {{balanceStake}} SUN</p>
                </div>
                <div class="stake-sunTron-footer" @click="unstakeToken()">
                    Claim & Unstake
                </div>
            </div>
           </div>
           </div>
           <div v-if="magiaodich!='https://shasta.tronscan.org/#/transaction/'" class="stake-sunTron-notification">
               <div class="stake-notification-exit" @click="magiaodich='https://shasta.tronscan.org/#/transaction/',getBalanceOfStake(),getBalanceOfToken()">+</div>
               <div>Bạn đã hoàn cmn tất giao dịch</div>
               <a v-bind:href="linkGiaoDich" target="_blank">fake fake fake</a>
           </div>
        </div>
        </div>
        <div class="vote-body" v-if="voteActive==true & voteItems==0">
            <div class="vote-body-title">
                <p>Vote</p>
            </div>
            <div class="vote-body-border">
                <div class="vote-body-border-header">
                    <span class="vote-body-border-header-hover" @click="voteBodyHeaderCheck= true" :class="{tim: voteBodyHeaderCheck,xam: !voteBodyHeaderCheck}">Active</span>
                    <span class="vote-body-border-header-hover" @click="voteBodyHeaderCheck= false" :class="{tim: !voteBodyHeaderCheck, xam:voteBodyHeaderCheck}">Closed</span>
                   <div class="vote-body-border-header-line">
                    <p class="vote-body-border-header-line-son1"></p>
                    <div v-if="voteBodyHeaderCheck"><p class="vote-body-border-header-line-son2-active"></p></div>
                    <div v-else><p class="vote-body-border-header-line-son2-ended"></p></div>
                   </div>
                </div>
                <div class="vote-body-border-body">
                    <div v-if="voteBodyHeaderCheck">
                        <div class="vote-body-border-body-true">
                            <img src="../src/assets/ruoiLogo.png">
                            <p>No proposal up for vote. Please check other voting instead.</p>
                        </div>
                    </div>
                    <div v-else>
                        <div class="vote-body-border-body-false">
                            <div class="vote-body-border-body-item1" @click="voteItems= 1">
                                <div>
                                    <p>Vote for Your Favorite Pool</p>
                                    <div class="vote-body-border-body-item1-border">Closed</div>
                                </div>
                            </div>
                            <div class="vote-body-border-body-item1" @click="voteItems= 2">
                                    <div>
                                    <p>Vote for Your Favorite Pool</p>
                                    <div class="vote-body-border-body-item1-border">Closed</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="vote-favorite" v-if="voteActive==true & voteItems==1">
            <p class="vote-favorite-title">Vote for Your Favorite Pool</p>
            <p class="vote-favorite-team">SUN Team</p>
            <div class="vote-favorite-body">
                 <div class="vote-favorite-left">
                <div class="vote-favorite-left-top"></div>
                <div class="vote-favorite-left-bot"></div>
            </div>
            <div class="vote-favorite-right">
                <div class="vote-favorite-right-top"></div>
                <div class="vote-favorite-right-bot"></div>
            </div>
            </div>
        </div>
        <div class="faqs-body" v-if="faqsActive">
            <div class="faqs-body-title">
                <p>FAQ</p>
            </div>
            <ul class="faqs-body-border">
                <li class="faqs-body-border-items">
                    <p class="faqs-body-border-tittle">What is SUN?</p>
                    <p class="faqs-body-border-content">SUN token is a social experiment dedicated to the development of TRON's DeFi ecosystem. Designed as the quintessential Bitcoin equivalent on TRON, SUN features zero VC investments, zero PE investments, no pre-mining or reserve for the team, and is fully operated by the community through its open-source smart contracts. SUN is a TRC20-based crypto asset with a total supply of 19900730.</p>
                    <p class="faqs-body-border-content">We hope to leverage SUN to promote the vigorous development of TRON's self-governing DeFi community.</p>
                    <p class="faqs-body-border-line"></p>
                </li>
                <li class="faqs-body-border-items">
                    <p class="faqs-body-border-tittle">How to participate in LP mining?</p>
                    <p class="faqs-body-border-content">Each mining pool follows its own schedule for start, ending and mining speed. You may check "Mining Rules" for more information.</p>
                    <p class="faqs-body-border-line"></p>
                </li>
                <li class="faqs-body-border-items">
                    <p class="faqs-body-border-tittle">How to participate in mining?</p>
                    <p class="faqs-body-border-content">You need TRX or Token on JustSwap to participate in mining. Select the corresponding pool and enter the amount of tokens you want to stake. You are ready to harvest SUN. Here are the detailed steps:</p>
                    <p class="faqs-body-border-content">Select the corresponding pool.</p>
                    <p class="faqs-body-border-content">Approval is needed when first staking Token. Click "Approve LP". And click "Accept” in the TronLink popup window for your signature to complete Token approval;</p>
                    <p class="faqs-body-border-content">Once the token is approved, enter the amount of Tokens you want to stake, and click "Stake". And click "Accept" in the TronLink popup window for your signature;</p>
                    <p class="faqs-body-border-content">Wait for 15-30 seconds after you submit your staking request. You can then view the number of Tokens you have staked and the SUN you can claim in the pool.</p>
                    <p class="faqs-body-border-line"></p>
                </li>
                <li class="faqs-body-border-items">
                    <p class="faqs-body-border-tittle">How to check and claim my SUN rewards?</p>
                    <p class="faqs-body-border-content">You may have some SUN left in your current and previous pools. You can check them out by clicking "Pending Claim".</p>
                    <p class="faqs-body-border-content">1) SUN can be claimed separately only from pools that are still active.</p>
                    <p class="faqs-body-border-content">2) Find the pool you participated in from the "Active" tab on the homepage. Click on "Select" and you will see a "Stake & Claim" popover.</p>
                    <p class="faqs-body-border-content">3) Switch the popover status to "Claim" and click "Claim" in the "Pending Claim" column. You will see a popover from TronLink asking for your signature. Click "Accept" to claim rewards.</p>
                    <p class="faqs-body-border-line"></p>
                </li>
                <li class="faqs-body-border-items">
                    <p class="faqs-body-border-tittle">How to migrate staked assets to new mining pools?</p>
                    <p class="faqs-body-border-content">· To expedite the process of participating in new pools, the platform allows users to migrate staked assets to new pools of the same token with a single click.</p>
                    <p class="faqs-body-border-content">· If you have staked assets in ended pools, In the ended tab, select the pool you have participated in, and click "Continue mining to enjoy higher profits" to start the migration process.Migration process:</p>
                    <p class="faqs-body-border-content">1) After clicking the "Continue mining for more profits" button, you will see instructions in a popover, which usually consists of three steps: "Authorize the pool to access XXX", "Unlock assets from original pools" and "Migrate unlocked assets to new pool". Your signature is needed for each step.</p>
                    <p class="faqs-body-border-content">2) Migration will finish after you sign all the three steps.</p>
                    <p class="faqs-body-border-content">Note: Migration can only succeed after each step is confirmed as a transaction on-chain. Within a minute after migration, you may receive a message saying your migration failed. In that case, you can either retry or unlock and stake your assets manually.</p>
                    <p class="faqs-body-border-line"></p>
                </li>
                <li class="faqs-body-border-items">
                    <p class="faqs-body-border-tittle">How to unlock staked assets？</p>
                    <p class="faqs-body-border-content">You can unlock your staked assets anytime whether the pool you joined is still running or not. You can enter the amount you want to unlock from pools that are active. For pools that are now ended, however, you will have to unlock all assets at once.</p>
                    <p class="faqs-body-border-content">· For active pools, please follow the steps below to "Claim & Unlock" assets:</p>
                    <p class="faqs-body-border-content">1) Find the pool you participated in from the "Active" tab on the homepage. Click on "Select" and you will see a popover.</p>
                    <p class="faqs-body-border-content">2) Switch the popover to the "Claim" page and enter the amount you want to unlock at "My Staked".</p>
                    <p class="faqs-body-border-content">3) Click "Claim and Unlock" and you will see a popover from TronLink asking for your signature. Click "Accept" to claim and unlock your assets.</p>
                    <p class="faqs-body-border-content">· For ended pools, please follow the steps below to "Claim & Unlock" assets:</p>
                    <p class="faqs-body-border-content">1) Find the pool you participated in the "Ended" tab on the homepage. Click "Claim and Unlock".</p>
                    <p class="faqs-body-border-content">2) You will see a popover from TronLink asking for your signature. Click "Accept" to claim and unlock your assets</p>
                    <p class="faqs-body-border-line"></p>
                </li>
                <li class="faqs-body-border-items">
                    <p class="faqs-body-border-tittle">Why does ‘My Earned’ show “0”?</p>
                    <p class="faqs-body-border-content">There are several reasons:</p>
                    <p class="faqs-body-border-content">1) The amount of SUN you earned is too small. Our asset field displays three digits after the decimal point and the number won’t show if it is too small.</p>
                    <p class="faqs-body-border-content">2) You have just staked your tokens, and the number won’t be displayed immediately. So please wait patiently until the information shows.</p>
                    <p class="faqs-body-border-line"></p>
                </li>
                <li class="faqs-body-border-items">
                    <p class="faqs-body-border-tittle">Phases of SUN Mining</p>
                    <p class="faqs-body-border-content">· Phase 1: Genesis Mining</p>
                    <p class="faqs-body-border-content">According to the design of the smart contract code, the amount of tokens mined will not be decreased. Staked TRX can only be unlocked til Genesis Mining concludes. A one-off SUN reward will be distributed after the completion of Genesis Mining in 24 hours.</p>
                    <p class="faqs-body-border-content">· Phase 2: Regular Mining</p>
                    <p class="faqs-body-border-content">According to the design of the smart contract code, staked TRX can be unlocked anytime during the Regular Mining period for SUN reward.</p>
                    <p class="faqs-body-border-content">· Phase 3: Ecosystem Convergence</p>
                    <p class="faqs-body-border-content">Integrating to multiple DeFi projects within the TRON ecosystem.</p>
                    <p class="faqs-body-border-content">· Phase 4: Community Self-Governance</p>
                    <p class="faqs-body-border-content">SUN holders will join in governing the SUN community. The more SUN they own, the greater power they have.</p>
                </li>
            </ul>
        </div>
        <div class="sun-footer">
            <a href="https://www.facebook.com/">Facebook</a>
            <a href="https://twitter.com/">Twitter</a>
            <a href="https://telegram.com/">Telegram</a>
        </div>
    </div>
</template>

<script>

export default {
        data(){ 
          return {
            sunActive: true,
            voteActive: false,
            faqsActive: false,
            activeCheck: true,
            endedCheck: false,
            voteBodyHeaderCheck: true,
            xCheck: true,
            addressId:'',
            voteItems: 0,
            sunTron:false,
            uTron:false,
            tTron:false,
            sunTronStake: true,
            bankAddress:'TNnBeZ8U5tt2wBC5TiqUWaxRu9LqhFT9zC',
            trc20ContractAddress: 'TRyhsLwZXaJv9KA15EJ2sQwiXmo8wVYhD1',
            balanceStake:0,
            sotienstake:0,
            sotienUnstake:0,
            balanceToken: 0,
            a:0,
            magiaodich:'',
            linkGiaoDich:'https://shasta.tronscan.org/#/transaction/'
            }
        },
        methods: {
            getAddressId: function(){
              if(window.tronWeb && window.tronWeb.defaultAddress.base58){
                  this.addressId= window.tronWeb.defaultAddress.base58
                  window.tronWeb.trx.getBalance(this.addressId) // thay dia chi cua vi vao
                  .then(result => this.balanceOfTrx = result / Math.pow(10,6));
              }
              else this.addressId=''
            },
            thaydoibody: function(){
                if(this.sunTron==true){
                    document.querySelector("body").style.overflowY = 'hidden'
                }
                else{
                    document.querySelector("body").style.overflowY = 'scroll'
                }
            },
            stakeToken: async function() {
            if(this.sotienstake!=0){
            try {
                // this.linkGiaoDich='https://shasta.tronscan.org/#/transaction/'
                let contract = await window.tronWeb.contract().at(this.trc20ContractAddress);
                await contract.stake(
                    this.sotienstake*10
                ).send({
                    feeLimit: 5000000
                }).then(output => this.magiaodich = output);
                this.linkGiaoDich=this.linkGiaoDich + this.magiaodich
                }
                catch(error) {
                console.error("trigger smart contract error",error)}
            }
            },
            getBalanceOfStake: async function(){
                let contract = await window.tronWeb.contract().at(this.trc20ContractAddress);
                await contract.balanceOfStake().call()
                .then(result => this.balanceStake = result/10)
                // .then(result => this.balanceStake = parseInt(result.balance._hex))
            },
            getMaxToken: async function(){
                let contract = await window.tronWeb.contract().at(this.trc20ContractAddress);
                await contract.balanceOf(this.addressId).call()
                .then(result => this.sotienstake = parseInt(result.balance._hex)/10)
            },
            getBalanceOfToken: async function(){
                let contract = await window.tronWeb.contract().at(this.trc20ContractAddress);
                await contract.balanceOf(this.addressId).call()
                .then(result => this.balanceToken = parseInt(result.balance._hex)/10)
            },
            unstakeToken: async function(){
                if(this.sotienUnstake!=0){
            try {
                // this.linkGiaoDich='https://shasta.tronscan.org/#/transaction/'
                let contract = await window.tronWeb.contract().at(this.trc20ContractAddress);
                await contract.unStaking(
                    this.sotienUnstake*10
                ).send({
                    feeLimit: 5000000
                })
                .then(output => this.magiaodich = output);
                this.linkGiaoDich=this.linkGiaoDich + this.magiaodich
                }
                catch(error) {
                console.error("trigger smart contract error",error)}
            }
            },
            claimWithDraw: async function(){
                let contract = await window.tronWeb.contract().at(this.trc20ContractAddress);
                 await contract.withDraw().send({
                    feeLimit: 5000000
                })
                .then(output => this.magiaodich = output)
                this.linkGiaoDich=this.linkGiaoDich + this.magiaodich
            },
        },
        created() {
        this.interval = setInterval(() => this.getAddressId(), 1000);
        //this.interval1 = setInterval(() => this.getBalanceOfStake(), 1000);
},
}
</script>

<style>
    *{
        margin: 0;
        padding: 0;
    }
    #sun{
        background-color: rgb(221, 221, 221);
        position: relative;
    }
    .sun-header-background-img{
        width: 100%;
        z-index: 1;
        position:absolute;
        height: 400px;
        background-size: cover;
        background-image: url('../src/assets/3.png');
    }

    .sun-header, .sun-body, .vote-body, .faqs-body ,.vote-favorite{
      position: relative;
      z-index: 3;
    }
    .sun-header-content{
        display: flex;
    }
    .sun-header-img{
        width: 42.5%;
    }
    .sun-header-img img{
        width: 20%;
        margin:30px 0px 0px 50px;
    }
    .sun-header-menu{
        width: 40.5%;
    }
    .sun-header-menu-menu{
        list-style: none;
        display: flex;
    }
    .sun-header-menu-menu li{
        margin-top: 45px;
    }
    .sun-header-menu-menu li div{
        margin-right: 25px;
        text-decoration: none;
        padding: 5px 15px;
    }
    .sun-header-connect{
      display: flex;
      padding-bottom: 100px;
      cursor: pointer;
    }
    .sun-header-connect-wallet-unconnect{
        border: 0px solid blueviolet;
        border-radius: 7.5px;
        padding: 5px 15px;
        margin-right: 50px;
        background-color: blueviolet;
    }
    .sun-header-connect-wallet-connect{
      border: 0px solid blueviolet;
      border-radius: 7.5px;
      padding: 5px 15px;
      margin-right: 50px;
      background-color: white;
      max-width: 120px;
      min-width: 120px;
      display: flex;
    }
    .sun-header-connect-wallet-connect span{
      color: black;
      text-overflow: ellipsis;
      overflow: hidden;
      text-decoration: none;
    }
    .sun-header-connect-wallet-connect img{
      width: 20px;
      margin-right: 5px;
    }
    .sun-header-connect-translate{
    }
    .sun-header-connect-translate-select{
        border: 0px solid blueviolet;
        border-radius: 7.5px;
        padding: 5px 15px;
    }
    .menucheck{
        color: white;
        border: 0px solid blueviolet;
        border-radius: 7.5px;
        padding: 5px 15px;
        background-color: blueviolet;
    }
    .sun-header-menu-menu li div{
        color: white;
    }
    .sun-header-menu-menu-hover:hover{
        color: white;
        border: 0px solid blueviolet;
        border-radius: 7.5px;
        background-color: blueviolet;
        cursor: pointer;
    }
    .dropdown {
    position: relative;
    display: inline-block;
    cursor: pointer;
    }

    .dropdown-content {
    display: none;
    position: absolute;
    background-color:rgb(221, 221, 221);
    min-width: 100px;
    z-index: 1;
    margin-top: 5px;
    }

    .dropdown-content a {  
    color: black;
    padding: 5px;
    text-decoration: none;
    float: left;
    display: block;
    }

    .dropdown-content a:hover {
        color: blueviolet;
    }

    .dropdown:hover .dropdown-content {
    display: block;
    }
    .sun-header-connect{
        width: 17%;
        color: white;
    }
    .sun-header-connect div{
        margin-top: 45px;
    }
    .sun-body-content{
        width: 95%;
        margin: -80px auto;
    }
    .sun-body-content h1, h2, h3, h3 a{
        text-align: center;
        color: white;
    }
    .sun-body-content h1{
        font-size: 50px;
        margin-top: 45px;
    }
    .sun-body-content h2{
        font-size: 18px;
        margin-top: 20px;
    }
    .sun-body-content h3{
        font-size: 12px;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .sun-body-content-box{
        border: white solid 1px;
        background-color: white;
        border-radius: 10px;
        width: 50%;
        margin: auto;
        display: flex;
        padding: 30px;
        margin-top: 70px;
        margin-bottom: 70px;
        position: relative;
    }
    .sun-body-content-box1{
        width: 80%;
    }
    .sun-body-content-box1-1{
        width: 40%;
    }
    .sun-body-content-box1-2{
        width: 60%;
        margin-top: 20px;
    }
    .sun-body-content-box1-2-p1{
        font-size: 20px;
    }
    .sun-body-content-box1-2-p2{
        font-size: 12px;
        opacity: 0.6;
    }
    .sun-body-content-box1-1 span{
        opacity: 0.8;
    }
    .sun-body-content-box2{
        width: 20%;
        border: 1px solid blueviolet;
        background-color: blueviolet;
        border-radius: 10px;
        padding: 10px;
        height: 20px;
        margin: auto;
    }
    .sun-body-content-box2 a{
        text-decoration: none;
        color: white;
        font-size: 15px;
    }
    .sun-body-content-warning{
        position: absolute;
        color: tomato;
        text-align: center;
        margin: auto;
        z-index: 2;
        border:1px solid rgb(240, 238, 117);
        border-radius: 2px;
        padding: 10px;
        background-color: rgb(255, 248, 232);
        margin-top: -100px;
        left: 0px;
        display: flex;
    }
    .sun-body-content-warning-x{
        transform: rotate(45deg);
        color: burlywood;
        margin-top: -10px;
        margin-right: 10px;
        font-size: 20px;
        cursor: pointer;
    }
    .sun-body-BODY-head{
        text-align: center;
        font-size: 20px;
        margin-bottom: 70px;
        margin-top: 150px;
    }
    .sun-body-BODY-head span span{
        cursor: pointer;
    }
    .sun-body-BODY-head-hover :hover{
        color: blueviolet;
    }
    .sun-body-content-box2 a span{
        border: 1px solid white;
        font-size: 10px;
        border-radius: 50%;
        padding: 1px;
        display: inline-block;
        width: 1em;
        height: 1em;
        text-align: center;
    }
        .sun-body-BODY-items{
            width: 60%;
            display: flex;
            margin: auto;
            margin-bottom: 20px;
        }
        .sun__item{
            position: relative;
            border: 0px solid white;
            border-radius: 15px;
            padding: 20px 10px 10px 10px;
            background-color: white;
            width: 30%;
            margin-right:20px ;
            overflow: hidden;
        }
        .sun__item-header{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .sun__item-header-img{
            position: relative;
            width:30%;
        }
        .sun__item-header-conten{
            width:70%;
        }
        .sun__item-header-conten-phu{
            opacity: 0.7;
            font-size: 13px;
        }
        .sun__item-tokuchou{
            font-size: 50%;
        }
        .sun__item-body2-item, .sun__item-body1{
            justify-content: space-between;
            display: flex;
            margin-top: 20px;
            margin-bottom: 10px;
        }
        .logo1, .logo2{
            float: left;
            width: 50%;
            margin: -5px;
        }
        .sun__item-body2{
            border: 1px solid white;
            border-radius: 15px;
            padding: 20px 10px;
            background-color: white;
            box-shadow: inset 0 -2px 8px 0 rgba(51,1,138,.08);
            margin-bottom: 50px;
        }
        .sun__item-footer{
            width: 100%;
        }
        .sun__item-footer a{
            text-decoration: none;
        }
        .sun__item-footer1{
            text-align: center;
        }
        .sun__item-footer2{
            width: 100%; margin: 10px auto;
            height: 30px;
            border-radius: 10px;
            background-color:rgba(137, 43, 226, 0.87);
            text-align: center;
            padding-top: 12px;
            opacity: 0.8;
            color: rgb(16, 53, 122);
            cursor: pointer;
        }
        .sun__item-footer2:active{
            opacity:0.4;
            transition: 0.5s;
        }
        .sun__item-header-conten-phu-phu{
            color: rgb(14, 73, 182);
            opacity: 1;
        }
        .sun__item-body1-phu{
            color: rgb(40, 199, 111);
        }
        .tim{
            color: blueviolet;
        }
        .xam{
            color: gray;
        }
        .xam:hover{
            color: blueviolet;
        }
        .trapezoid {
        transform: rotate(-315deg);
        transform-origin: right top;
        font-family: AvenirNext-Bold;
        font-size: 14px;
        color: rgb(255, 255, 255);
        background: rgb(153, 153, 153);
        position: absolute;
        right: -25px;
        top: 80px;
        height: 33px;
        line-height: 33px;
        width: 150px;
        text-align: center;
        }
    .sun-footer{
        display: flex;
        margin: 30px auto 0;
        width: 20%;
        justify-content:space-between;
        position: relative;
        z-index: 2;
    }
    .sun-footer a{
        color:gray;
        text-decoration: none;
    }
    .vote-body{
        margin: auto;
        width: 60%;
        margin-top: 20px;
    }
    .vote-body-border{
        background:white;
        box-shadow: rgba(148, 148, 148, 0.06) 0px 20px 40px 0px;
        border-radius: 10px;
        min-height: 610px;
        padding: 20px;
        margin-top: 20px;
    }
    .vote-body-title{
        color: white;
        font-size: 20px;
    }
    .vote-body-border-header{
        margin-top: 15px;
        height: 10%;
    }
    .vote-body-border-body-header-hover:hover{
        color: blueviolet;
        transition: 0.3s;
    }
    .vote-body-border-header-line{
        position: relative;
        margin-top: 10px;
    }
    .vote-body-border-header-line-son1{
        height: 2px;
        width: 100%;
        background-color: rgb(179, 179, 179);
        z-index: 1;
        position: absolute;
    }
    .vote-body-border-header-line-son2-active{
        height: 2px;
        background-color: blueviolet;
        width: 4%;
        position: absolute;
        z-index: 2;
    }
    .vote-body-border-header-line-son2-ended{
        height: 2px;
        background-color: blueviolet;
        width: 4%;
        position: absolute;
        z-index: 2;
        left:5.8%;
    }
    .vote-body-border-header span{
        margin-right: 20px;
        cursor: pointer;
    }
    .vote-body-border-body{
        height: 90%;
        margin:auto;
    }
    .vote-body-border-body-true{
        text-align: center;
        width: 80%;
        margin: 50px auto;
    }
    .vote-body-border-body-true img{
        margin-top: 10%;
    }
    .vote-body-border-body-true p{
        margin-top: 5%;
    }
    .vote-body-border-body-false{
        margin:40px auto;
    }
    .vote-body-border-body-item1{
        margin-top:5px;
        border: 0px solid;
        border-radius: 10px;
        background-color: rgb(224, 224, 224);
        padding: 30px 20px;
        min-width: 80%;
        min-height: 100px;
        cursor: pointer;
    }
    .vote-body-border-body-item1-border{
        border: 0px solid;
        background-color: rgba(94, 93, 93, 0.938) ;
        padding: 7px 15px;
        max-width: 50px;
        border-radius: 10px;
        text-align: center;
        margin-top:50px ;
    }
    .vote-favorite{
        width: 85%;
        margin: auto;
    }
    .vote-favorite-title{
        font-size: 20px;
        color: white;
    }
    .vote-favorite-team{
        margin-top:5px ;
        color: white;
        font-size: 13px;
    }
    .vote-favorite-body{
        display: flex;
    }
    .vote-favorite-right{
        width: 30%;
    }
    .vote-favorite-left{
        width: 70%;
        margin-right: 20px;
    }
    .vote-favorite-left div{
        margin-top:20px ;
    }
    .vote-favorite-left-top{
        border: 0px solid;
        min-height: 100px;
        background-color:white;
        border-radius: 10px;
        padding: 30px 20px;
    }
    .vote-favorite-left-bot{
        border: 0px solid;
        min-height: 200px;
        background-color: white;
        border-radius: 10px;
        padding: 30px 20px;
    }
    .vote-favorite-right div{
        margin-top:20px ;
    }
    .vote-favorite-right-top{
        border: 0px solid;
        min-height: 100px;
        background-color: white;  
        border-radius: 10px;
        padding: 30px 20px;
    }
    .vote-favorite-right-bot{
        border: 0px solid;
        min-height: 200px;
        background-color: white;  
        border-radius: 10px;
        padding: 30px 20px;
    }
    .faqs-body{
        margin: auto;
        width: 60%;
        margin-top: -100px;
    }
    .faqs-body-border{
        background:white;
        box-shadow: rgba(148, 148, 148, 0.06) 0px 20px 40px 0px;
        border-radius: 10px;
        min-height: 585px;
        padding: 20px 30px;
        margin-top: 20px;
        list-style-type:decimal ;
    }
    .faqs-body-border-content{
        font-size: 14px;
        opacity: 0.7;
    }
    .faqs-body-title{
        color: white;
        font-size: 50px;
        text-align: center;
        margin: 100px 0;
    }
    .faqs-body-border-tittle{
        font-size: 18px;
        margin-bottom: 10px;
    }
    .faqs-body-border-line{
        width: 100%;
        height: 1px;
        margin: 10px 0;
        background-color: rgb(196, 194, 194);
    }
    .stake-sunTron{
        position: absolute;
        z-index: 5;
    }
    .stake-sunTron{
        border:0px solid;
        border-radius: 20px;
        /* padding: 75px 10px 40px 10px; */
        min-width: 25%;
        min-height: 50%;
        background-color: white;
        top:30%;
        left: 35.5%;
        box-shadow: 0px 0px 0px 50000px  rgba(0, 0, 0, 0.452);
        font-size: 20px;
    }
    .stake-body{
        position: relative;
    }
    .stake-sunTron-content{
        position: absolute;
        padding: 30px 0px;
        margin-left: 20%;
    }
    .stake-sunTron-notification{
        /* display: none; */
        position: absolute;
        z-index: 6;
        border:0px solid;
        border-radius: 15px;
        min-width: 100%;
        min-height: 400px;
        background-color: white;
        margin-top:10% ;
        box-shadow: 0px 0px 0px 50000px  rgba(0, 0, 0, 0.452);
    }
    .stake-notification-exit{
        color: rgb(10, 4, 4);
        transform: rotate(45deg);
        font-size: 50px;
        max-width: 20px;
        margin-left:90%;
        cursor: pointer;
    }
    .stake-sunTron-exit{
        color: black;
        transform: rotate(45deg);
        font-size: 50px;
        max-width: 20px;
        margin-left:120%;
        margin-top: -10%;
        cursor: pointer;
    }
    .stake-sunTron-exit:hover{
        opacity: 0.5;
        transition: 0.2s;
    }
    .stake-sunTron-header{
        text-align: center;
        justify-content: space-between;
    }
    /* .stake-sunTron-header span{
        font-size: 20px;
    } */
    .stake-sunTron-header-claim{
        float: right;
        margin-right:20%;
        cursor: pointer;
        overflow: visible;
    }
    .stake-sunTron-header-claim:hover{
        border-bottom: 2px solid blueviolet;
        padding-bottom: 15px;
        min-width: 50px;
    }
    .stake-sunTron-header-stake{
        float: left;
        margin-left:20%;
        cursor: pointer;
        overflow: visible;
    }
    .stake-sunTron-header-stake:hover{
        border-bottom: 2px solid blueviolet;
        padding-bottom: 15px;
        min-width: 50px;
    }
    .stakesunTronheaderhover{
        border-bottom: 2px solid blueviolet;
        padding-bottom: 15px;
        min-width: 50px;
    }
    .stake-sunTron-body{
        margin-top: 15%;
    }
    .stake-sunTron-body1{
        margin-top: 50px;
    }
    .stake-sunTron-body2{
        margin-top: 50px;
    }
    .stake-sunTron-body1 p span{
        border: 0px solid;
        border-radius: 10px;
        padding: 7px;
        background-color: blueviolet;
        color:white;
        font-size: 10px;
        float: right;
        cursor: pointer;
    }
    .stake-sunTron-body2 p span{
        border: 0px solid;
        border-radius: 10px;
        padding: 7px;
        background-color: blueviolet;
        color:white;
        font-size: 10px;
        float: right;
        cursor: pointer;
    }
    .stake-sunTron-body2-footer{
        font-size: 15px;
        opacity: 0.7;
    }
    .stake-sunTron-input1{
        border:2px solid white;
        padding: 10px;
        background-color:rgb(196, 194, 194,0.7);
        border-radius: 10px;
        min-width: 95%;
        min-height: 40px;
        font-size: 20px;
        margin: auto;
        margin-top: 10px;
    }
    .stake-sunTron-input1-1{
       font-size: 20px;
       margin-top: 5px;
    }
    /* .stake-sunTron-input1:focus{
        border-radius: 10px;
        border-color: blueviolet;
        background-color: white;
        outline: none;
    } */
    .stake-sunTron-input2{
        border:1px solid white;
        padding: 10px;
        background-color:rgb(196, 194, 194,0.7);
        border-radius: 10px;
        min-width: 95%;
        min-height: 40px;
        margin-top: 10px;
        font-size: 20px;
    }
    .stake-sunTron-input2:focus{
         border-radius: 10px;
        border-color: blueviolet;
        background-color: white;
        outline: none;
    }
    .stake-sunTron-footer{
        border:0px solid;
        border-radius: 10px;
        padding: 15px 20px;
        text-align: center;
        background-color: blueviolet;
        color: white;
        margin-top: 30%;
        cursor: pointer;
    }
</style>