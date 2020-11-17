<%--
  Created by IntelliJ IDEA.
  User: Mohan
  Date: 11/16/2020
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<style>
    #weather-modal{
        text-align: center;
        color: #dc4734;
        font-size: 24px;
    }
    #weather-container {
        margin: auto;
        display : flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }
    #weather-container  h3{
        color: white !important;
        margin-top: 0px;
        font-size: 16px;
        font-weight: bold;
    }
    #weather-container .temp{
        margin-top: -10px 10px;
    }
    #weather-container>div{
        text-align: center;
        background: #345ed4;
        color: white;
        width: 140px;
        height: 100px;
        padding : 10px;
        margin : 5px;
        border-radius:80px;
    }
    .temp {
        display: flex;
        align-items: center;
        justify-content: space-around;
    }
    .dayTemp {
        font-size: 18px;
    }
</style>
<!-- Modal -->
<div class="modal fade" id="weatherModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="weather-modal">Mogok weather</h4>
            </div>
            <div class="modal-body">

                <div id="weather-container">
                    <div class="weatherBox" id="day1">
                        <h3>Tuesday</h3>
                        <div class="temp">
                            <div>
                                <i class="fas fa-snowflake fa-2x"></i>
                            </div>
                            <div>
                                <p class="dayTemp">23°</p>
                                <p class="nightTemp">10°</p>
                            </div>
                        </div>
                    </div>
                    <div class="weatherBox" id="day2">
                        <h3>Tuesday</h3>
                        <div class="temp">
                            <div>
                                <i class="fas fa-cloud-sun fa-2x"></i>
                            </div>
                            <div>
                                <p class="dayTemp">23°</p>
                                <p class="nightTemp">10°</p>
                            </div>
                        </div>
                    </div>
                    <div class="weatherBox" id="day3">
                        <h3>Wednesday</h3>
                        <div class="temp">
                            <div>
                                <i class="fas fa-sun fa-2x"></i>
                            </div>
                            <div>
                                <p class="dayTemp">23°</p>
                                <p class="nightTemp">10°</p>
                            </div>
                        </div>
                    </div>
                    <div class="weatherBox" id="day4">
                        <h3>Thursday</h3>
                        <div class="temp">
                            <div>
                                <i class="fas fa-cloud fa-2x"></i>
                            </div>
                            <div>
                                <p class="dayTemp">23°</p>
                                <p class="nightTemp">10°</p>
                            </div>
                        </div>
                    </div>
                    <div class="weatherBox" id="day5">
                        <h3>Friday</h3>
                        <div class="temp">
                            <div>
                                <i class="fas fa-cloud-showers fa-2x"></i>
                            </div>
                            <div>
                                <p class="dayTemp">23°</p>
                                <p class="nightTemp">10°</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-share" data-dismiss="modal" style="position: relative; top: 16px;">Close</button>
            </div>
        </div>
    </div>
</div>

