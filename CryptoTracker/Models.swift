//
//  Models.swift
//  CryptoTracker
//
//  Created by Артем Сергеев on 27.07.2022.
//

import Foundation

struct Crypto: Codable {
    let asset_id: String?
    let name: String?
    let price_usd: Float?
    let id_icon: String?
}

struct Icon: Codable {
    let asset_id: String?
    let url: String?
}







// https://rest.coinapi.io/v1/assets/?apikey=9DAC0D76-49EC-434B-84A3-1C9E727848E7
//{
//    "asset_id": "BTC",
//    "name": "Bitcoin",
//    "type_is_crypto": 1,
//    "data_quote_start": "2014-02-24T17:43:05.0000000Z",
//    "data_quote_end": "2022-07-27T00:00:00.0000000Z",
//    "data_orderbook_start": "2014-02-24T17:43:05.0000000Z",
//    "data_orderbook_end": "2022-07-27T00:00:00.0000000Z",
//    "data_trade_start": "2010-07-17T23:09:17.0000000Z",
//    "data_trade_end": "2022-07-27T00:00:00.0000000Z",
//    "data_symbols_count": 105934,
//    "volume_1hrs_usd": 3580204933314008.91,
//    "volume_1day_usd": 35273846615934155451.19,
//    "volume_1mth_usd": 8040534559500947239410.43,
//    "price_usd": 21676.912350384719194749790172,
//    "id_icon": "4caf2b16-a017-4e26-a348-2cea69c34cba",
//    "data_start": "2010-07-17",
//    "data_end": "2022-07-27"
//  }


// https://rest.coinapi.io/v1/assets/icons/100/?apikey=9DAC0D76-49EC-434B-84A3-1C9E727848E7
//{
//    "asset_id": "BTC",
//    "url": "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/4caf2b16a0174e26a3482cea69c34cba.png"
//  }
