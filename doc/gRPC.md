# gRPC

Compile Spring
Compile Spring-Boot
gradle publishes files to .M2 at ~/.gradle/caches/modules-2/files-2.1

### Links
```
[gRPC Github](https://github.com/grpc/grpc/blob/master/doc/g_stands_for.md)  
[Google Developer](https://developers.google.com/protocol-buffers)
```

### Overview
Remote Proceedure Call (RPC) are based on HTTP and some are built ontop of
REpresentational State Transfer (REST).

gRPC is built on HTTP 2.0 and supports full duplex


gRPC focuses on optimizing 3 layers of the OSI model, (Application,
Presentation and Session).


### Protoc files
Protoc files define the cotract between systems.
Example Protoc file

The number is the position of field.  Priortize message fields with fields that
will always be filled out first and optional ones at the end.  A limit of 15(?)

```
syntax = "proto2";
message Film {
    string title = 1;
    string director = 2;
    string producer = 3;
    optional string release_date = 4;
    repeated string characters = 5;
}
```

### Nested Types
```
syntax = "proto2";

message Film {
    message Character {
        string name = 1;
        int64 birth = 2;
    }
    string title = 1;
    string director = 2;
    string producer = 3;
    optional string release_date = 4;
    repeated Character characters = 5;
}
In the example above, if Character needs to be used elsewhere it may be imported as follows:


message OtherFilm {
    repeated Film.Character characters = 1;
}
```

### MAPS

```
syntax = "proto2";

message Film {
    message Character {
        string name = 1;
        int64 birth = 2;
    }
    map<string, Character> roles = 1;
}
```


### OneOf
```
syntax = "proto2";

message Film {
    message Character {
        oneof has {
            string laser_gun_model = 1;
            int32 laser_sword_power = 2;
        }
    }
}
```


### Enum
```
syntax = "proto2";

message Film {
    enum ProducerCompanies {
        UNKNOWN = 0;
        WARNER_BROS = 1;
        PARAMOUNT = 2;
        NETFLIX = 3;
    }
    ProducerCompanies Producer = 1 [default = UNKNOWN];
}
```
### Services
Services are defined remote procedure calls

```
syntax = "proto2";

service Starwars {

    rpc GetFilm(GetFilmRequest) returns (GetFilmResponse);
}
```

### Defining Proto Files
To keep the proto files easy to read define all messages at the root level then include them
in the nested message.  If you have multiple proto messages define the proto message in a
file with similar name.

```
syntax = "proto2";

message Character {

    oneof has {
        string laser_gun_model = 1;
        int32 laser_sword_power = 2;
    }

}

message Film {

    repeated Character characters = 1;

}
```
or import the character.proto file that defines Character

```
syntax = "proto2";

import "character.proto";

message Film {

    repeated Character characters = 1;

}

```

### Polymorphism
