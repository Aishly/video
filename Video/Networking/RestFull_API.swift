//
//  RestFull_API.swift
//  ReadyAssist
//
//  Created by Pooja Negi on 02/08/17.
//  Copyright © 2017 ReadyAssist. All rights reserved.
//

import Foundation

struct PingAPI {
    
    //Test URL
    static var ReadyAssist_API = "https://fast-ridge-93318.herokuapp.com/"
    static var ReadyAssist_Towing_Api = "https://dry-ravine-89718.herokuapp.com/"
    
    //Production Url
//    static var ReadyAssist_API = ""
    
   static var GEO_FENCING = "https://hidden-ridge-28540.herokuapp.com/readyassist/api/user/geofenceIOS"
    
    
    ///=========================== LOGIN
    static var LOGIN_API = PingAPI.ReadyAssist_API + "customer_registration"
    static var REGISTRATION_API = PingAPI.ReadyAssist_API + "new_customer"
    static var OTP_VERIFY_NEWUSER = PingAPI.ReadyAssist_API + "confirm_new"
    static var OTP_VERIFY_REGISTEREDUSER = PingAPI.ReadyAssist_API + "confirm_old"
    
    ///==========================   MAP GEO  LOCATION RESTRICTION
    static var RESTRICT_SERVICE_LOCATION_API = PingAPI.ReadyAssist_API + "confirm_new"
    
    
    ///=========================== CREATE_ORDER
    static var GET_VEHICLE_MAKE_API = PingAPI.ReadyAssist_API + "registerd"
    static var GET_VEHICLE_MODEL_API = PingAPI.ReadyAssist_API + "models"
    static var GET_VEHICLE_SERVICES_API = PingAPI.ReadyAssist_API + "services"
    static var GET_TIME_SLOTS_API = PingAPI.ReadyAssist_API + "time_slots"
    static var SUBMIT_ORDER_API = PingAPI.ReadyAssist_API + "create_order"
    static var DISCOUNT_COUPON_API = PingAPI.ReadyAssist_API + "discount"    
    static var GET_TAX_DEFINATION = PingAPI.ReadyAssist_API + "tax_definition"

    
    ///========================== TRACK ORDER
    static var GET_ALL_PREVIOUS_ORDER_API = PingAPI.ReadyAssist_API + ""
    static var ORDER_SUMMARY_DETAILS_API = PingAPI.ReadyAssist_API + ""
    static var SH_TIMELINE_DETAILS_API = PingAPI.ReadyAssist_API + ""
    static var ORDER_HISTORY_API = PingAPI.ReadyAssist_API + ""
    static var ORDER_SUMMARY_API = PingAPI.ReadyAssist_API + "track_orders"

    
    ///=========================== Towing Service
    static var TOWING_SERVICE_API = PingAPI.ReadyAssist_Towing_Api + "admin-towing/" /// TOWING BASE URL IS DIFFERENT
    
    ///=========================== User Profile
    static var USER_PROFILE_API = PingAPI.ReadyAssist_API + "customer_addinfo"
    static var USER_INFO_GET_API = PingAPI.ReadyAssist_API + "customer_info"
    static var MY_VEHICLE_GETINFO_API = PingAPI.ReadyAssist_API +  "my_vehicles"
    static var CHANGE_PASSWORD_API = PingAPI.ReadyAssist_API + ""
    
    
    ///========================== Payment for service
    static var PAYMENT_API = PingAPI.ReadyAssist_API + "payment"
    
    
    ///========================= KNOWLARITY api
    static var KNOWLARITY_API =  " http://etsrds.kapps.in/webapi/readyassist/api/readyassist_14176_c2c.py"
    
}
