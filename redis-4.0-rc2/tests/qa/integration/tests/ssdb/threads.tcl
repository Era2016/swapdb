start_server {tags {"ssdb"} } {
    test "multi threads access same key" {
        set host [srv host]
        set port [srv port]
        set num 100
        set clist [start_bg_complex_data_list $host $port $num 10]
        after 200
        stop_bg_complex_data_list $clist
        # check redis still work
        after 100
        r ping
    } {PONG}

    test "multi threads complex ops" {
        set host [srv host]
        set port [srv port]
        set num 10000
        set clist [start_bg_complex_data_list $host $port $num 10]
        after 200
        stop_bg_complex_data_list $clist
        # check redis still work
        after 100
        r ping
    } {PONG}
}
