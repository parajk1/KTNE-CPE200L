
/*
//Example module to use a slow clock.
//KEEP AS REFERENCE

module timer(input logic clk_in,
             output logic led);

logic [25:0] count = 0;
logic clk_out;

    always @ (posedge clk_in) begin
        count <= count + 1;
            if (count == 25_000_000) begin
                count <= 0;
                clk_out = ~clk_out;
            end 
    end

    assign led = clk_out;   
endmodule*/



//Timer module that will countdown from 180-0 seconds, in the FPGA board.
module timer(input logic clk_in,      //CLOCK_50
            output logic [6:0] segA,  //HEX1
            output logic [6:0] segB,  //HEX1
            output logic [6:0] segC); //HEX0

    logic [25:0] count = 0; //to count to 1sec
    logic [7:0] seconds = 0; //counter for timer
    logic clk_out;           //clock generated

    //clock
    always @ (posedge clk_in) begin
        count <= count + 1;                //incrment counter
            if (count == 50_000_000) begin //50MHz is converted from 50mill Hz (1sec)
                count <= 0;                //restart count
                clk_out = ~clk_out;        //generate a clock
                seconds = seconds + 1;     //increment second
            end 
    end

    //seven seg numbers carrying binary #'s 0-9
    localparam [6:0] s0 = 7'b1000000;
    localparam [6:0] s1 = 7'b1111001;
    localparam [6:0] s2 = 7'b0100100;
    localparam [6:0] s3 = 7'b0110000;
    localparam [6:0] s4 = 7'b0011001;
    localparam [6:0] s5 = 7'b0010010;
    localparam [6:0] s6 = 7'b0000010;
    localparam [6:0] s7 = 7'b1111000;
    localparam [6:0] s8 = 7'b0000000;
    localparam [6:0] s9 = 7'b0011000;


    //for every generated clock, timer will update the seconds.
    always @ (clk_out) begin 
        case(seconds)
              0:    {segA, segB, segC}     =    {s1,s8,s0}; //180
              1:    {segA, segB, segC}     =    {s1,s7,s9}; //179
              2:    {segA, segB, segC}     =    {s1,s7,s8}; //178  
              3:    {segA, segB, segC}     =    {s1,s7,s7}; //177
              4:    {segA, segB, segC}     =    {s1,s7,s6}; //176
              5:    {segA, segB, segC}     =    {s1,s7,s5}; //175
              6:    {segA, segB, segC}     =    {s1,s7,s4}; //174
              7:    {segA, segB, segC}     =    {s1,s7,s3}; //173
              8:    {segA, segB, segC}     =    {s1,s7,s2}; //172
              9:    {segA, segB, segC}     =    {s1,s7,s1}; //171
             10:    {segA, segB, segC}     =    {s1,s7,s0}; //170
             11:    {segA, segB, segC}     =    {s1,s6,s9}; //169
             12:    {segA, segB, segC}     =    {s1,s6,s8}; //168
             13:    {segA, segB, segC}     =    {s1,s6,s7}; //167
             14:    {segA, segB, segC}     =    {s1,s6,s6}; //166
             15:    {segA, segB, segC}     =    {s1,s6,s5}; //165
             16:    {segA, segB, segC}     =    {s1,s6,s4}; //164
             17:    {segA, segB, segC}     =    {s1,s6,s3}; //163
             18:    {segA, segB, segC}     =    {s1,s6,s2}; //162
             19:    {segA, segB, segC}     =    {s1,s6,s1}; //161
             20:    {segA, segB, segC}     =    {s1,s6,s0}; //160
             21:    {segA, segB, segC}     =    {s1,s5,s9}; //159
             22:    {segA, segB, segC}     =    {s1,s5,s8}; //158
             23:    {segA, segB, segC}     =    {s1,s5,s7}; //157
             24:    {segA, segB, segC}     =    {s1,s5,s6}; //156
             25:    {segA, segB, segC}     =    {s1,s5,s5}; //155
             26:    {segA, segB, segC}     =    {s1,s5,s4}; //154
             27:    {segA, segB, segC}     =    {s1,s5,s3}; //153
             28:    {segA, segB, segC}     =    {s1,s5,s2}; //152
             29:    {segA, segB, segC}     =    {s1,s5,s1}; //151
             30:    {segA, segB, segC}     =    {s1,s5,s0}; //150
             31:    {segA, segB, segC}     =    {s1,s4,s9}; //149
             32:    {segA, segB, segC}     =    {s1,s4,s8}; //148
             33:    {segA, segB, segC}     =    {s1,s4,s7}; //147
             34:    {segA, segB, segC}     =    {s1,s4,s6}; //146
             35:    {segA, segB, segC}     =    {s1,s4,s5}; //145
             36:    {segA, segB, segC}     =    {s1,s4,s4}; //144
             37:    {segA, segB, segC}     =    {s1,s4,s3}; //143
             38:    {segA, segB, segC}     =    {s1,s4,s2}; //142
             39:    {segA, segB, segC}     =    {s1,s4,s1}; //141
             40:    {segA, segB, segC}     =    {s1,s4,s0}; //140
             41:    {segA, segB, segC}     =    {s1,s3,s9}; //139
             42:    {segA, segB, segC}     =    {s1,s3,s8}; //138
             43:    {segA, segB, segC}     =    {s1,s3,s7}; //137
             44:    {segA, segB, segC}     =    {s1,s3,s6}; //136
             45:    {segA, segB, segC}     =    {s1,s3,s5}; //135
             46:    {segA, segB, segC}     =    {s1,s3,s4}; //134
             47:    {segA, segB, segC}     =    {s1,s3,s3}; //133
             48:    {segA, segB, segC}     =    {s1,s3,s2}; //132
             49:    {segA, segB, segC}     =    {s1,s3,s1}; //131
             50:    {segA, segB, segC}     =    {s1,s3,s0}; //130
             51:    {segA, segB, segC}     =    {s1,s2,s9}; //129
             52:    {segA, segB, segC}     =    {s1,s2,s8}; //128
             53:    {segA, segB, segC}     =    {s1,s2,s7}; //127
             54:    {segA, segB, segC}     =    {s1,s2,s6}; //126
             55:    {segA, segB, segC}     =    {s1,s2,s5}; //125
             56:    {segA, segB, segC}     =    {s1,s2,s4}; //124
             57:    {segA, segB, segC}     =    {s1,s2,s3}; //123
             58:    {segA, segB, segC}     =    {s1,s2,s2}; //122
             59:    {segA, segB, segC}     =    {s1,s2,s1}; //121
             60:    {segA, segB, segC}     =    {s1,s2,s0}; //120
             61:    {segA, segB, segC}     =    {s1,s1,s9}; //119
             62:    {segA, segB, segC}     =    {s1,s1,s8}; //118
             63:    {segA, segB, segC}     =    {s1,s1,s7}; //117
             64:    {segA, segB, segC}     =    {s1,s1,s6}; //116
             65:    {segA, segB, segC}     =    {s1,s1,s5}; //115
             66:    {segA, segB, segC}     =    {s1,s1,s4}; //114
             67:    {segA, segB, segC}     =    {s1,s1,s3}; //113
             68:    {segA, segB, segC}     =    {s1,s1,s2}; //112
             69:    {segA, segB, segC}     =    {s1,s1,s1}; //111
             70:    {segA, segB, segC}     =    {s1,s1,s0}; //110
             71:    {segA, segB, segC}     =    {s1,s0,s9}; //109
             72:    {segA, segB, segC}     =    {s1,s0,s8}; //108
             73:    {segA, segB, segC}     =    {s1,s0,s7}; //107
             74:    {segA, segB, segC}     =    {s1,s0,s6}; //106
             75:    {segA, segB, segC}     =    {s1,s0,s5}; //105
             76:    {segA, segB, segC}     =    {s1,s0,s4}; //104
             77:    {segA, segB, segC}     =    {s1,s0,s3}; //103
             78:    {segA, segB, segC}     =    {s1,s0,s2}; //102
             79:    {segA, segB, segC}     =    {s1,s0,s1}; //101
             80:    {segA, segB, segC}     =    {s1,s0,s0}; //100
             81:    {segA, segB, segC}     =    {s0,s9,s9}; //099
             82:    {segA, segB, segC}     =    {s0,s9,s8}; //098
             83:    {segA, segB, segC}     =    {s0,s9,s7}; //097
             84:    {segA, segB, segC}     =    {s0,s9,s6}; //096
             85:    {segA, segB, segC}     =    {s0,s9,s5}; //095
             86:    {segA, segB, segC}     =    {s0,s9,s4}; //094
             87:    {segA, segB, segC}     =    {s0,s9,s3}; //093
             88:    {segA, segB, segC}     =    {s0,s9,s2}; //092
             89:    {segA, segB, segC}     =    {s0,s9,s1}; //091
             90:    {segA, segB, segC}     =    {s0,s9,s0}; //090
             91:    {segA, segB, segC}     =    {s0,s8,s9}; //089
             92:    {segA, segB, segC}     =    {s0,s8,s8}; //088
             93:    {segA, segB, segC}     =    {s0,s8,s7}; //087
             94:    {segA, segB, segC}     =    {s0,s8,s6}; //086
             95:    {segA, segB, segC}     =    {s0,s8,s5}; //085
             96:    {segA, segB, segC}     =    {s0,s8,s4}; //084
             97:    {segA, segB, segC}     =    {s0,s8,s3}; //083
             98:    {segA, segB, segC}     =    {s0,s8,s2}; //082
             99:    {segA, segB, segC}     =    {s0,s8,s1}; //081
            100:    {segA, segB, segC}     =    {s0,s8,s0}; //080
            101:    {segA, segB, segC}     =    {s0,s7,s9}; //079
            102:    {segA, segB, segC}     =    {s0,s7,s8}; //078
            103:    {segA, segB, segC}     =    {s0,s7,s7}; //077
            104:    {segA, segB, segC}     =    {s0,s7,s6}; //076
            105:    {segA, segB, segC}     =    {s0,s7,s5}; //075
            106:    {segA, segB, segC}     =    {s0,s7,s4}; //074
            107:    {segA, segB, segC}     =    {s0,s7,s3}; //073
            108:    {segA, segB, segC}     =    {s0,s7,s2}; //072
            109:    {segA, segB, segC}     =    {s0,s7,s1}; //071
            110:    {segA, segB, segC}     =    {s0,s7,s0}; //070
            111:    {segA, segB, segC}     =    {s0,s6,s9}; //069
            112:    {segA, segB, segC}     =    {s0,s6,s8}; //068
            113:    {segA, segB, segC}     =    {s0,s6,s7}; //067
            114:    {segA, segB, segC}     =    {s0,s6,s6}; //066
            115:    {segA, segB, segC}     =    {s0,s6,s5}; //065
            116:    {segA, segB, segC}     =    {s0,s6,s4}; //064
            117:    {segA, segB, segC}     =    {s0,s6,s3}; //063
            118:    {segA, segB, segC}     =    {s0,s6,s2}; //062
            119:    {segA, segB, segC}     =    {s0,s6,s1}; //061
            120:    {segA, segB, segC}     =    {s0,s6,s0}; //060
            121:    {segA, segB, segC}     =    {s0,s5,s9}; //059
            122:    {segA, segB, segC}     =    {s0,s5,s8}; //058
            123:    {segA, segB, segC}     =    {s0,s5,s7}; //057
            124:    {segA, segB, segC}     =    {s0,s5,s6}; //056
            125:    {segA, segB, segC}     =    {s0,s5,s5}; //055
            126:    {segA, segB, segC}     =    {s0,s5,s4}; //054
            127:    {segA, segB, segC}     =    {s0,s5,s3}; //053
            128:    {segA, segB, segC}     =    {s0,s5,s2}; //052
            129:    {segA, segB, segC}     =    {s0,s5,s1}; //051
            130:    {segA, segB, segC}     =    {s0,s5,s0}; //050
            131:    {segA, segB, segC}     =    {s0,s4,s9}; //049
            132:    {segA, segB, segC}     =    {s0,s4,s8}; //048
            133:    {segA, segB, segC}     =    {s0,s4,s7}; //047
            134:    {segA, segB, segC}     =    {s0,s4,s6}; //046
            135:    {segA, segB, segC}     =    {s0,s4,s5}; //045
            136:    {segA, segB, segC}     =    {s0,s4,s4}; //044
            137:    {segA, segB, segC}     =    {s0,s4,s3}; //043
            138:    {segA, segB, segC}     =    {s0,s4,s2}; //042
            139:    {segA, segB, segC}     =    {s0,s4,s1}; //041
            140:    {segA, segB, segC}     =    {s0,s4,s0}; //040
            141:    {segA, segB, segC}     =    {s0,s3,s9}; //039
            142:    {segA, segB, segC}     =    {s0,s3,s8}; //038
            143:    {segA, segB, segC}     =    {s0,s3,s7}; //037
            144:    {segA, segB, segC}     =    {s0,s3,s6}; //036
            145:    {segA, segB, segC}     =    {s0,s3,s5}; //035
            146:    {segA, segB, segC}     =    {s0,s3,s4}; //034
            147:    {segA, segB, segC}     =    {s0,s3,s3}; //033
            148:    {segA, segB, segC}     =    {s0,s3,s2}; //032
            149:    {segA, segB, segC}     =    {s0,s3,s1}; //031
            150:    {segA, segB, segC}     =    {s0,s3,s0}; //030
            151:    {segA, segB, segC}     =    {s0,s2,s9}; //029
            152:    {segA, segB, segC}     =    {s0,s2,s8}; //028
            153:    {segA, segB, segC}     =    {s0,s2,s7}; //027
            154:    {segA, segB, segC}     =    {s0,s2,s6}; //026
            155:    {segA, segB, segC}     =    {s0,s2,s5}; //025
            156:    {segA, segB, segC}     =    {s0,s2,s4}; //024
            157:    {segA, segB, segC}     =    {s0,s2,s3}; //023
            158:    {segA, segB, segC}     =    {s0,s2,s2}; //022
            159:    {segA, segB, segC}     =    {s0,s2,s1}; //021
            160:    {segA, segB, segC}     =    {s0,s2,s0}; //020
            161:    {segA, segB, segC}     =    {s0,s1,s9}; //019
            162:    {segA, segB, segC}     =    {s0,s1,s8}; //018
            163:    {segA, segB, segC}     =    {s0,s1,s7}; //017
            164:    {segA, segB, segC}     =    {s0,s1,s6}; //016
            165:    {segA, segB, segC}     =    {s0,s1,s5}; //015
            166:    {segA, segB, segC}     =    {s0,s1,s4}; //014
            167:    {segA, segB, segC}     =    {s0,s1,s3}; //013
            168:    {segA, segB, segC}     =    {s0,s1,s2}; //012
            169:    {segA, segB, segC}     =    {s0,s1,s1}; //011
            170:    {segA, segB, segC}     =    {s0,s1,s0}; //010
            171:    {segA, segB, segC}     =    {s0,s0,s9}; //009
            172:    {segA, segB, segC}     =    {s0,s0,s8}; //008
            173:    {segA, segB, segC}     =    {s0,s0,s7}; //007
            174:    {segA, segB, segC}     =    {s0,s0,s6}; //006
            175:    {segA, segB, segC}     =    {s0,s0,s5}; //005
            176:    {segA, segB, segC}     =    {s0,s0,s4}; //004
            177:    {segA, segB, segC}     =    {s0,s0,s3}; //003
            178:    {segA, segB, segC}     =    {s0,s0,s2}; //002
            179:    {segA, segB, segC}     =    {s0,s0,s1}; //001
            180:    {segA, segB, segC}     =    {s0,s0,s0}; //000
        endcase
    end 
    
endmodule

