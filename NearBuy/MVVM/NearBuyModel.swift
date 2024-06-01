//
//  NearBuyModel.swift
//  NearBuy
//
//  Created by Tarun Khurana on 01/06/24.
//



import Foundation
import ObjectMapper

struct NearBuyModel : Mappable {
    var venues : [Venues]?
    var meta : Meta?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        venues <- map["venues"]
        meta <- map["meta"]
    }

}

struct Venues : Mappable {
    var state : String?
    var name_v2 : String?
    var postal_code : String?
    var name : String?
    var links : [String]?
    var timezone : String?
    var url : String?
    var score : Int?
    var location : Location?
    var address : String?
    var country : String?
    var has_upcoming_events : Bool?
    var num_upcoming_events : Int?
    var city : String?
    var slug : String?
    var extended_address : String?
    var stats : Stats?
    var id : Int?
    var popularity : Int?
    var access_method : String?
    var metro_code : Int?
    var capacity : Int?
    var display_location : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        state <- map["state"]
        name_v2 <- map["name_v2"]
        postal_code <- map["postal_code"]
        name <- map["name"]
        links <- map["links"]
        timezone <- map["timezone"]
        url <- map["url"]
        score <- map["score"]
        location <- map["location"]
        address <- map["address"]
        country <- map["country"]
        has_upcoming_events <- map["has_upcoming_events"]
        num_upcoming_events <- map["num_upcoming_events"]
        city <- map["city"]
        slug <- map["slug"]
        extended_address <- map["extended_address"]
        stats <- map["stats"]
        id <- map["id"]
        popularity <- map["popularity"]
        access_method <- map["access_method"]
        metro_code <- map["metro_code"]
        capacity <- map["capacity"]
        display_location <- map["display_location"]
    }

}

struct Location : Mappable {
    var lat : Double?
    var lon : Double?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        lat <- map["lat"]
        lon <- map["lon"]
    }

}

struct Stats : Mappable {
    var event_count : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        event_count <- map["event_count"]
    }

}

struct Meta : Mappable {
    var total : Int?
    var took : Int?
    var page : Int?
    var per_page : Int?
    var geolocation : Geolocation?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        total <- map["total"]
        took <- map["took"]
        page <- map["page"]
        per_page <- map["per_page"]
        geolocation <- map["geolocation"]
    }

}

struct Geolocation : Mappable {
    var lat : Double?
    var lon : Double?
    var city : String?
    var state : String?
    var country : String?
    var postal_code : String?
    var display_name : String?
    var metro_code : String?
    var range : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        lat <- map["lat"]
        lon <- map["lon"]
        city <- map["city"]
        state <- map["state"]
        country <- map["country"]
        postal_code <- map["postal_code"]
        display_name <- map["display_name"]
        metro_code <- map["metro_code"]
        range <- map["range"]
    }

}
