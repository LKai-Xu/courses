/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sun Dec 17 14:50:25 2023
/////////////////////////////////////////////////////////////


module cordic ( clk, rst_n, start, angle, cos, sin );
  input [15:0] angle;
  output [15:0] cos;
  output [15:0] sin;
  input clk, rst_n, start;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18,
         N19, working, N23, N32, N33, N34, N35, n1886, n1887, n1888, n1889,
         n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897, n1898, n1899,
         n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907, n1908, n1909,
         n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917, n1918, n1919,
         n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927, n1928, n1929,
         n1930, n1931, n1932, n1933, \intadd_0/B[13] , \intadd_0/B[12] ,
         \intadd_0/B[11] , \intadd_0/B[10] , \intadd_0/B[9] , \intadd_0/B[8] ,
         \intadd_0/B[7] , \intadd_0/B[6] , \intadd_0/B[5] , \intadd_0/B[4] ,
         \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] , \intadd_0/B[0] ,
         \intadd_0/CI , \intadd_0/SUM[13] , \intadd_0/SUM[12] ,
         \intadd_0/SUM[11] , \intadd_0/SUM[10] , \intadd_0/SUM[9] ,
         \intadd_0/SUM[8] , \intadd_0/SUM[7] , \intadd_0/SUM[6] ,
         \intadd_0/SUM[5] , \intadd_0/SUM[4] , \intadd_0/SUM[3] ,
         \intadd_0/SUM[2] , \intadd_0/SUM[1] , \intadd_0/SUM[0] ,
         \intadd_0/n15 , \intadd_0/n14 , \intadd_0/n13 , \intadd_0/n12 ,
         \intadd_0/n11 , \intadd_0/n10 , \intadd_0/n9 , \intadd_0/n8 ,
         \intadd_0/n7 , \intadd_0/n6 , \intadd_0/n5 , \intadd_0/n4 ,
         \intadd_0/n3 , \intadd_0/n2 , \intadd_1/B[13] , \intadd_1/B[12] ,
         \intadd_1/B[11] , \intadd_1/B[10] , \intadd_1/B[9] , \intadd_1/B[8] ,
         \intadd_1/B[7] , \intadd_1/B[6] , \intadd_1/B[5] , \intadd_1/B[4] ,
         \intadd_1/B[3] , \intadd_1/B[2] , \intadd_1/B[1] , \intadd_1/B[0] ,
         \intadd_1/CI , \intadd_1/SUM[13] , \intadd_1/SUM[12] ,
         \intadd_1/SUM[11] , \intadd_1/SUM[10] , \intadd_1/SUM[9] ,
         \intadd_1/SUM[8] , \intadd_1/SUM[7] , \intadd_1/SUM[6] ,
         \intadd_1/SUM[5] , \intadd_1/SUM[4] , \intadd_1/SUM[3] ,
         \intadd_1/SUM[2] , \intadd_1/SUM[1] , \intadd_1/SUM[0] ,
         \intadd_1/n15 , \intadd_1/n14 , \intadd_1/n13 , \intadd_1/n12 ,
         \intadd_1/n11 , \intadd_1/n10 , \intadd_1/n9 , \intadd_1/n8 ,
         \intadd_1/n7 , \intadd_1/n6 , \intadd_1/n5 , \intadd_1/n4 ,
         \intadd_1/n3 , \intadd_1/n2 , \intadd_2/B[3] , \intadd_2/B[2] ,
         \intadd_2/B[1] , \intadd_2/B[0] , \intadd_2/CI , \intadd_2/SUM[3] ,
         \intadd_2/SUM[2] , \intadd_2/SUM[1] , \intadd_2/SUM[0] ,
         \intadd_2/n5 , \intadd_2/n4 , \intadd_2/n3 , \intadd_2/n2 ,
         \intadd_3/B[2] , \intadd_3/B[1] , \intadd_3/B[0] , \intadd_3/CI ,
         \intadd_3/SUM[2] , \intadd_3/SUM[1] , \intadd_3/SUM[0] ,
         \intadd_3/n3 , \intadd_3/n2 , \intadd_3/n1 , n1934, n1935, n1936,
         n1937, n1938, n1939, n1940, n1941, n1942, n1943, n1944, n1945, n1946,
         n1947, n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955, n1956,
         n1957, n1958, n1959, n1960, n1961, n1962, n1963, n1964, n1965, n1966,
         n1967, n1968, n1969, n1970, n1971, n1972, n1973, n1974, n1975, n1976,
         n1977, n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985, n1986,
         n1987, n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995, n1996,
         n1997, n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005, n2006,
         n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015, n2016,
         n2017, n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025, n2026,
         n2027, n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035, n2036,
         n2037, n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045, n2046,
         n2047, n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056,
         n2057, n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066,
         n2067, n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076,
         n2077, n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085, n2086,
         n2087, n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095, n2096,
         n2097, n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105, n2106,
         n2107, n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115, n2116,
         n2117, n2118, n2119, n2120, n2121, n2122, n2123, n2124, n2125, n2126,
         n2127, n2128, n2129, n2130, n2131, n2132, n2133, n2134, n2135, n2136,
         n2137, n2138, n2139, n2140, n2141, n2142, n2143, n2144, n2145, n2146,
         n2147, n2148, n2149, n2150, n2151, n2152, n2153, n2154, n2155, n2156,
         n2157, n2158, n2159, n2160, n2161, n2162, n2163, n2164, n2165, n2166,
         n2167, n2168, n2169, n2170, n2171, n2172, n2173, n2174, n2175, n2176,
         n2177, n2178, n2179, n2180, n2181, n2182, n2183, n2184, n2185, n2186,
         n2187, n2188, n2189, n2190, n2191, n2192, n2193, n2194, n2195, n2196,
         n2197, n2198, n2199, n2200, n2201, n2202, n2203, n2204, n2205, n2206,
         n2207, n2208, n2209, n2210, n2211, n2212, n2213, n2214, n2215, n2216,
         n2217, n2218, n2219, n2220, n2221, n2222, n2223, n2224, n2225, n2226,
         n2227, n2228, n2229, n2230, n2231, n2232, n2233, n2234, n2235, n2236,
         n2237, n2238, n2239, n2240, n2241, n2242, n2243, n2244, n2245, n2246,
         n2247, n2248, n2249, n2250, n2251, n2252, n2253, n2254, n2255, n2256,
         n2257, n2258, n2259, n2260, n2261, n2262, n2263, n2264, n2265, n2266,
         n2267, n2268, n2269, n2270, n2271, n2272, n2273, n2274, n2275, n2276,
         n2277, n2278, n2279, n2280, n2281, n2282, n2283, n2284, n2285, n2286,
         n2287, n2288, n2289, n2290, n2291, n2292, n2293, n2294, n2295, n2296,
         n2297, n2298, n2299, n2300, n2301, n2302, n2303, n2304, n2305, n2306,
         n2307, n2308, n2309, n2310, n2311, n2312, n2313, n2314, n2315, n2316,
         n2317, n2318, n2319, n2320, n2321, n2322, n2323, n2324, n2325, n2326,
         n2327, n2328, n2329, n2330, n2331, n2332, n2333, n2334, n2335, n2336,
         n2337, n2338, n2339, n2340, n2341, n2342, n2343, n2344, n2345, n2346,
         n2347, n2348, n2349, n2350, n2351, n2352, n2353, n2354;
  wire   [15:0] sampled_angle;
  wire   [15:0] inner_angle;
  wire   [3:0] state;

  DFFARX1_RVT \sampled_angle_reg[15]  ( .D(n1901), .CLK(clk), .RSTB(rst_n), 
        .Q(sampled_angle[15]) );
  DFFARX1_RVT \sampled_angle_reg[14]  ( .D(n1900), .CLK(clk), .RSTB(rst_n), 
        .Q(sampled_angle[14]), .QN(n2353) );
  DFFARX1_RVT \sampled_angle_reg[13]  ( .D(n1899), .CLK(clk), .RSTB(rst_n), 
        .Q(sampled_angle[13]) );
  DFFARX1_RVT \sampled_angle_reg[12]  ( .D(n1898), .CLK(clk), .RSTB(rst_n), 
        .Q(sampled_angle[12]) );
  DFFARX1_RVT \sampled_angle_reg[11]  ( .D(n1897), .CLK(clk), .RSTB(rst_n), 
        .Q(sampled_angle[11]) );
  DFFARX1_RVT \sampled_angle_reg[10]  ( .D(n1896), .CLK(clk), .RSTB(rst_n), 
        .Q(sampled_angle[10]) );
  DFFARX1_RVT \sampled_angle_reg[9]  ( .D(n1895), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[9]) );
  DFFARX1_RVT \sampled_angle_reg[8]  ( .D(n1894), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[8]) );
  DFFARX1_RVT \sampled_angle_reg[7]  ( .D(n1893), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[7]) );
  DFFARX1_RVT \sampled_angle_reg[6]  ( .D(n1892), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[6]) );
  DFFARX1_RVT \sampled_angle_reg[5]  ( .D(n1891), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[5]) );
  DFFARX1_RVT \sampled_angle_reg[4]  ( .D(n1890), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[4]) );
  DFFARX1_RVT \sampled_angle_reg[3]  ( .D(n1889), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[3]) );
  DFFARX1_RVT \sampled_angle_reg[2]  ( .D(n1888), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[2]) );
  DFFARX1_RVT \sampled_angle_reg[1]  ( .D(n1887), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[1]) );
  DFFARX1_RVT \sampled_angle_reg[0]  ( .D(n1886), .CLK(clk), .RSTB(rst_n), .Q(
        sampled_angle[0]), .QN(n2338) );
  DFFARX1_RVT \state_reg[0]  ( .D(N32), .CLK(clk), .RSTB(rst_n), .Q(state[0]), 
        .QN(n2308) );
  DFFARX1_RVT \state_reg[3]  ( .D(N35), .CLK(clk), .RSTB(rst_n), .Q(state[3]), 
        .QN(n2312) );
  DFFARX1_RVT \state_reg[1]  ( .D(N33), .CLK(clk), .RSTB(rst_n), .Q(state[1]), 
        .QN(n2340) );
  DFFARX1_RVT \state_reg[2]  ( .D(N34), .CLK(clk), .RSTB(rst_n), .Q(state[2]), 
        .QN(n2323) );
  DFFARX1_RVT \inner_angle_reg[0]  ( .D(N4), .CLK(clk), .RSTB(rst_n), .Q(
        inner_angle[0]) );
  DFFARX1_RVT \inner_angle_reg[1]  ( .D(N5), .CLK(clk), .RSTB(rst_n), .Q(
        inner_angle[1]), .QN(n2337) );
  DFFARX1_RVT \inner_angle_reg[2]  ( .D(N6), .CLK(clk), .RSTB(rst_n), .QN(
        n2332) );
  DFFARX1_RVT \inner_angle_reg[3]  ( .D(N7), .CLK(clk), .RSTB(rst_n), .Q(
        inner_angle[3]), .QN(n2335) );
  DFFARX1_RVT \inner_angle_reg[4]  ( .D(N8), .CLK(clk), .RSTB(rst_n), .QN(
        n2333) );
  DFFARX1_RVT \inner_angle_reg[5]  ( .D(N9), .CLK(clk), .RSTB(rst_n), .QN(
        n2334) );
  DFFARX1_RVT \inner_angle_reg[6]  ( .D(N10), .CLK(clk), .RSTB(rst_n), .QN(
        n2317) );
  DFFARX1_RVT \inner_angle_reg[7]  ( .D(N11), .CLK(clk), .RSTB(rst_n), .Q(
        inner_angle[7]), .QN(n2319) );
  DFFARX1_RVT \inner_angle_reg[8]  ( .D(N12), .CLK(clk), .RSTB(rst_n), .QN(
        n2318) );
  DFFARX1_RVT \inner_angle_reg[9]  ( .D(N13), .CLK(clk), .RSTB(rst_n), .Q(
        inner_angle[9]), .QN(n2336) );
  DFFARX1_RVT \inner_angle_reg[10]  ( .D(N14), .CLK(clk), .RSTB(rst_n), .Q(
        inner_angle[10]), .QN(n2343) );
  DFFARX1_RVT \inner_angle_reg[11]  ( .D(N15), .CLK(clk), .RSTB(rst_n), .QN(
        n2342) );
  DFFARX1_RVT \inner_angle_reg[12]  ( .D(N16), .CLK(clk), .RSTB(rst_n), .Q(
        inner_angle[12]), .QN(n2345) );
  DFFARX1_RVT \inner_angle_reg[13]  ( .D(N17), .CLK(clk), .RSTB(rst_n), .QN(
        n2326) );
  DFFARX1_RVT \inner_angle_reg[14]  ( .D(N18), .CLK(clk), .RSTB(rst_n), .Q(
        inner_angle[14]), .QN(n2330) );
  DFFARX1_RVT \inner_angle_reg[15]  ( .D(N19), .CLK(clk), .RSTB(rst_n), .Q(
        inner_angle[15]), .QN(n2350) );
  DFFARX1_RVT \cos_reg[0]  ( .D(n1933), .CLK(clk), .RSTB(rst_n), .Q(cos[0]), 
        .QN(n2351) );
  DFFARX1_RVT \sin_reg[15]  ( .D(n1902), .CLK(clk), .RSTB(rst_n), .Q(sin[15]), 
        .QN(n2309) );
  DFFARX1_RVT \cos_reg[15]  ( .D(n1918), .CLK(clk), .RSTB(rst_n), .Q(cos[15]), 
        .QN(n2311) );
  DFFARX1_RVT \sin_reg[2]  ( .D(n1915), .CLK(clk), .RSTB(rst_n), .Q(sin[2]) );
  DFFARX1_RVT \sin_reg[3]  ( .D(n1914), .CLK(clk), .RSTB(rst_n), .Q(sin[3]) );
  DFFARX1_RVT \cos_reg[2]  ( .D(n1931), .CLK(clk), .RSTB(rst_n), .Q(cos[2]) );
  DFFARX1_RVT \cos_reg[3]  ( .D(n1930), .CLK(clk), .RSTB(rst_n), .Q(cos[3]) );
  DFFARX1_RVT \sin_reg[4]  ( .D(n1913), .CLK(clk), .RSTB(rst_n), .Q(sin[4]), 
        .QN(n2347) );
  DFFARX1_RVT \cos_reg[1]  ( .D(n1932), .CLK(clk), .RSTB(rst_n), .Q(cos[1]) );
  DFFARX1_RVT \sin_reg[0]  ( .D(n1917), .CLK(clk), .RSTB(rst_n), .Q(sin[0]), 
        .QN(n2352) );
  DFFARX1_RVT \sin_reg[1]  ( .D(n1916), .CLK(clk), .RSTB(rst_n), .Q(sin[1]) );
  DFFARX1_RVT \cos_reg[4]  ( .D(n1929), .CLK(clk), .RSTB(rst_n), .Q(cos[4]), 
        .QN(n2346) );
  DFFARX1_RVT \sin_reg[5]  ( .D(n1912), .CLK(clk), .RSTB(rst_n), .Q(sin[5]), 
        .QN(n2349) );
  DFFARX1_RVT \cos_reg[5]  ( .D(n1928), .CLK(clk), .RSTB(rst_n), .Q(cos[5]), 
        .QN(n2348) );
  DFFARX1_RVT \sin_reg[6]  ( .D(n1911), .CLK(clk), .RSTB(rst_n), .Q(sin[6]), 
        .QN(n2328) );
  DFFARX1_RVT \cos_reg[6]  ( .D(n1927), .CLK(clk), .RSTB(rst_n), .Q(cos[6]), 
        .QN(n2329) );
  DFFARX1_RVT \sin_reg[7]  ( .D(n1910), .CLK(clk), .RSTB(rst_n), .Q(sin[7]), 
        .QN(n2344) );
  DFFARX1_RVT \sin_reg[8]  ( .D(n1909), .CLK(clk), .RSTB(rst_n), .Q(sin[8]), 
        .QN(n2324) );
  DFFARX1_RVT \cos_reg[8]  ( .D(n1925), .CLK(clk), .RSTB(rst_n), .Q(cos[8]), 
        .QN(n2327) );
  DFFARX1_RVT \sin_reg[9]  ( .D(n1908), .CLK(clk), .RSTB(rst_n), .Q(sin[9]), 
        .QN(n2314) );
  DFFARX1_RVT \cos_reg[9]  ( .D(n1924), .CLK(clk), .RSTB(rst_n), .Q(cos[9]), 
        .QN(n2321) );
  DFFARX1_RVT \sin_reg[10]  ( .D(n1907), .CLK(clk), .RSTB(rst_n), .Q(sin[10]), 
        .QN(n2313) );
  DFFARX1_RVT \cos_reg[10]  ( .D(n1923), .CLK(clk), .RSTB(rst_n), .Q(cos[10]), 
        .QN(n2316) );
  DFFARX1_RVT \sin_reg[11]  ( .D(n1906), .CLK(clk), .RSTB(rst_n), .Q(sin[11]), 
        .QN(n2320) );
  DFFARX1_RVT \sin_reg[12]  ( .D(n1905), .CLK(clk), .RSTB(rst_n), .Q(sin[12]), 
        .QN(n2315) );
  DFFARX1_RVT \sin_reg[13]  ( .D(n1904), .CLK(clk), .RSTB(rst_n), .Q(sin[13]), 
        .QN(n2339) );
  FADDX1_RVT \intadd_0/U16  ( .A(\intadd_0/B[0] ), .B(sin[1]), .CI(
        \intadd_0/CI ), .CO(\intadd_0/n15 ), .S(\intadd_0/SUM[0] ) );
  FADDX1_RVT \intadd_0/U15  ( .A(\intadd_0/B[1] ), .B(sin[2]), .CI(
        \intadd_0/n15 ), .CO(\intadd_0/n14 ), .S(\intadd_0/SUM[1] ) );
  FADDX1_RVT \intadd_0/U14  ( .A(\intadd_0/B[2] ), .B(sin[3]), .CI(
        \intadd_0/n14 ), .CO(\intadd_0/n13 ), .S(\intadd_0/SUM[2] ) );
  FADDX1_RVT \intadd_0/U13  ( .A(\intadd_0/B[3] ), .B(sin[4]), .CI(
        \intadd_0/n13 ), .CO(\intadd_0/n12 ), .S(\intadd_0/SUM[3] ) );
  FADDX1_RVT \intadd_0/U12  ( .A(\intadd_0/B[4] ), .B(sin[5]), .CI(
        \intadd_0/n12 ), .CO(\intadd_0/n11 ), .S(\intadd_0/SUM[4] ) );
  FADDX1_RVT \intadd_0/U11  ( .A(\intadd_0/B[5] ), .B(sin[6]), .CI(
        \intadd_0/n11 ), .CO(\intadd_0/n10 ), .S(\intadd_0/SUM[5] ) );
  FADDX1_RVT \intadd_0/U10  ( .A(\intadd_0/B[6] ), .B(sin[7]), .CI(
        \intadd_0/n10 ), .CO(\intadd_0/n9 ), .S(\intadd_0/SUM[6] ) );
  FADDX1_RVT \intadd_0/U9  ( .A(\intadd_0/B[7] ), .B(sin[8]), .CI(
        \intadd_0/n9 ), .CO(\intadd_0/n8 ), .S(\intadd_0/SUM[7] ) );
  FADDX1_RVT \intadd_0/U8  ( .A(\intadd_0/B[8] ), .B(sin[9]), .CI(
        \intadd_0/n8 ), .CO(\intadd_0/n7 ), .S(\intadd_0/SUM[8] ) );
  FADDX1_RVT \intadd_0/U7  ( .A(\intadd_0/B[9] ), .B(sin[10]), .CI(
        \intadd_0/n7 ), .CO(\intadd_0/n6 ), .S(\intadd_0/SUM[9] ) );
  FADDX1_RVT \intadd_0/U6  ( .A(\intadd_0/B[10] ), .B(sin[11]), .CI(
        \intadd_0/n6 ), .CO(\intadd_0/n5 ), .S(\intadd_0/SUM[10] ) );
  FADDX1_RVT \intadd_0/U5  ( .A(\intadd_0/B[11] ), .B(sin[12]), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(\intadd_0/SUM[11] ) );
  FADDX1_RVT \intadd_0/U4  ( .A(\intadd_0/B[12] ), .B(sin[13]), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(\intadd_0/SUM[12] ) );
  FADDX1_RVT \intadd_0/U3  ( .A(\intadd_0/B[13] ), .B(sin[14]), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(\intadd_0/SUM[13] ) );
  FADDX1_RVT \intadd_1/U16  ( .A(\intadd_1/B[0] ), .B(cos[1]), .CI(
        \intadd_1/CI ), .CO(\intadd_1/n15 ), .S(\intadd_1/SUM[0] ) );
  FADDX1_RVT \intadd_1/U15  ( .A(\intadd_1/B[1] ), .B(cos[2]), .CI(
        \intadd_1/n15 ), .CO(\intadd_1/n14 ), .S(\intadd_1/SUM[1] ) );
  FADDX1_RVT \intadd_1/U14  ( .A(\intadd_1/B[2] ), .B(cos[3]), .CI(
        \intadd_1/n14 ), .CO(\intadd_1/n13 ), .S(\intadd_1/SUM[2] ) );
  FADDX1_RVT \intadd_1/U13  ( .A(\intadd_1/B[3] ), .B(cos[4]), .CI(
        \intadd_1/n13 ), .CO(\intadd_1/n12 ), .S(\intadd_1/SUM[3] ) );
  FADDX1_RVT \intadd_1/U12  ( .A(\intadd_1/B[4] ), .B(cos[5]), .CI(
        \intadd_1/n12 ), .CO(\intadd_1/n11 ), .S(\intadd_1/SUM[4] ) );
  FADDX1_RVT \intadd_1/U11  ( .A(\intadd_1/B[5] ), .B(cos[6]), .CI(
        \intadd_1/n11 ), .CO(\intadd_1/n10 ), .S(\intadd_1/SUM[5] ) );
  FADDX1_RVT \intadd_1/U10  ( .A(\intadd_1/B[6] ), .B(cos[7]), .CI(
        \intadd_1/n10 ), .CO(\intadd_1/n9 ), .S(\intadd_1/SUM[6] ) );
  FADDX1_RVT \intadd_1/U9  ( .A(\intadd_1/B[7] ), .B(cos[8]), .CI(
        \intadd_1/n9 ), .CO(\intadd_1/n8 ), .S(\intadd_1/SUM[7] ) );
  FADDX1_RVT \intadd_1/U8  ( .A(\intadd_1/B[8] ), .B(cos[9]), .CI(
        \intadd_1/n8 ), .CO(\intadd_1/n7 ), .S(\intadd_1/SUM[8] ) );
  FADDX1_RVT \intadd_1/U7  ( .A(\intadd_1/B[9] ), .B(cos[10]), .CI(
        \intadd_1/n7 ), .CO(\intadd_1/n6 ), .S(\intadd_1/SUM[9] ) );
  FADDX1_RVT \intadd_1/U6  ( .A(\intadd_1/B[10] ), .B(cos[11]), .CI(
        \intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(\intadd_1/SUM[10] ) );
  FADDX1_RVT \intadd_1/U5  ( .A(\intadd_1/B[11] ), .B(cos[12]), .CI(
        \intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(\intadd_1/SUM[11] ) );
  FADDX1_RVT \intadd_1/U4  ( .A(\intadd_1/B[12] ), .B(cos[13]), .CI(
        \intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[12] ) );
  FADDX1_RVT \intadd_1/U3  ( .A(\intadd_1/B[13] ), .B(cos[14]), .CI(
        \intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[13] ) );
  FADDX1_RVT \intadd_2/U6  ( .A(\intadd_2/B[0] ), .B(n2342), .CI(\intadd_2/CI ), .CO(\intadd_2/n5 ), .S(\intadd_2/SUM[0] ) );
  FADDX1_RVT \intadd_2/U5  ( .A(\intadd_2/B[1] ), .B(n2345), .CI(\intadd_2/n5 ), .CO(\intadd_2/n4 ), .S(\intadd_2/SUM[1] ) );
  FADDX1_RVT \intadd_2/U4  ( .A(\intadd_2/B[2] ), .B(n2326), .CI(\intadd_2/n4 ), .CO(\intadd_2/n3 ), .S(\intadd_2/SUM[2] ) );
  FADDX1_RVT \intadd_2/U3  ( .A(\intadd_2/B[3] ), .B(n2330), .CI(\intadd_2/n3 ), .CO(\intadd_2/n2 ), .S(\intadd_2/SUM[3] ) );
  FADDX1_RVT \intadd_3/U4  ( .A(\intadd_3/B[0] ), .B(n2333), .CI(\intadd_3/CI ), .CO(\intadd_3/n3 ), .S(\intadd_3/SUM[0] ) );
  FADDX1_RVT \intadd_3/U3  ( .A(\intadd_3/B[1] ), .B(n2334), .CI(\intadd_3/n3 ), .CO(\intadd_3/n2 ), .S(\intadd_3/SUM[1] ) );
  FADDX1_RVT \intadd_3/U2  ( .A(\intadd_3/B[2] ), .B(n2317), .CI(\intadd_3/n2 ), .CO(\intadd_3/n1 ), .S(\intadd_3/SUM[2] ) );
  DFFARX1_RVT working_reg ( .D(N23), .CLK(clk), .RSTB(rst_n), .Q(working), 
        .QN(n2331) );
  DFFARX1_RVT \cos_reg[11]  ( .D(n1922), .CLK(clk), .RSTB(rst_n), .Q(cos[11]), 
        .QN(n2354) );
  DFFARX1_RVT \cos_reg[14]  ( .D(n1919), .CLK(clk), .RSTB(rst_n), .Q(cos[14]), 
        .QN(n2341) );
  DFFARX1_RVT \cos_reg[12]  ( .D(n1921), .CLK(clk), .RSTB(rst_n), .Q(cos[12]), 
        .QN(n2325) );
  DFFARX1_RVT \sin_reg[14]  ( .D(n1903), .CLK(clk), .RSTB(rst_n), .Q(sin[14]), 
        .QN(n2322) );
  DFFARX1_RVT \cos_reg[13]  ( .D(n1920), .CLK(clk), .RSTB(rst_n), .Q(cos[13]), 
        .QN(n2310) );
  DFFARX1_RVT \cos_reg[7]  ( .D(n1926), .CLK(clk), .RSTB(rst_n), .Q(cos[7]) );
  OA22X1_RVT U1553 ( .A1(n1935), .A2(n2314), .A3(n2270), .A4(n2347), .Y(n2067)
         );
  OA22X1_RVT U1554 ( .A1(n2262), .A2(n2321), .A3(n2270), .A4(n2346), .Y(n2201)
         );
  INVX0_RVT U1555 ( .A(n2262), .Y(n1934) );
  INVX0_RVT U1556 ( .A(n1934), .Y(n1935) );
  AND2X2_RVT U1557 ( .A1(n2307), .A2(n2331), .Y(n2304) );
  NAND3X2_RVT U1558 ( .A1(n2022), .A2(state[0]), .A3(n2312), .Y(n2270) );
  INVX2_RVT U1559 ( .A(start), .Y(n2307) );
  OR2X1_RVT U1560 ( .A1(n2350), .A2(sampled_angle[15]), .Y(n1957) );
  NAND2X0_RVT U1561 ( .A1(sampled_angle[15]), .A2(n2350), .Y(n1936) );
  NAND3X0_RVT U1562 ( .A1(inner_angle[14]), .A2(n1936), .A3(n2353), .Y(n1956)
         );
  NAND2X0_RVT U1563 ( .A1(sampled_angle[13]), .A2(n2326), .Y(n1937) );
  NAND2X0_RVT U1564 ( .A1(inner_angle[12]), .A2(n1937), .Y(n1938) );
  OA22X1_RVT U1565 ( .A1(sampled_angle[12]), .A2(n1938), .A3(sampled_angle[13]), .A4(n2326), .Y(n1954) );
  AO22X1_RVT U1566 ( .A1(sampled_angle[13]), .A2(n2326), .A3(sampled_angle[12]), .A4(n2345), .Y(n1953) );
  OA22X1_RVT U1567 ( .A1(sampled_angle[9]), .A2(n2336), .A3(sampled_angle[8]), 
        .A4(n2318), .Y(n1948) );
  NAND2X0_RVT U1568 ( .A1(inner_angle[0]), .A2(n2338), .Y(n1939) );
  AO222X1_RVT U1569 ( .A1(sampled_angle[1]), .A2(n2337), .A3(sampled_angle[1]), 
        .A4(n1939), .A5(n2337), .A6(n1939), .Y(n1940) );
  AO222X1_RVT U1570 ( .A1(sampled_angle[2]), .A2(n1940), .A3(sampled_angle[2]), 
        .A4(n2332), .A5(n1940), .A6(n2332), .Y(n1941) );
  AO222X1_RVT U1571 ( .A1(sampled_angle[3]), .A2(n2335), .A3(sampled_angle[3]), 
        .A4(n1941), .A5(n2335), .A6(n1941), .Y(n1942) );
  AO222X1_RVT U1572 ( .A1(sampled_angle[4]), .A2(n1942), .A3(sampled_angle[4]), 
        .A4(n2333), .A5(n1942), .A6(n2333), .Y(n1943) );
  AO222X1_RVT U1573 ( .A1(sampled_angle[5]), .A2(n1943), .A3(sampled_angle[5]), 
        .A4(n2334), .A5(n1943), .A6(n2334), .Y(n1944) );
  AO222X1_RVT U1574 ( .A1(sampled_angle[6]), .A2(n2317), .A3(sampled_angle[6]), 
        .A4(n1944), .A5(n2317), .A6(n1944), .Y(n1945) );
  AO222X1_RVT U1575 ( .A1(sampled_angle[7]), .A2(n2319), .A3(sampled_angle[7]), 
        .A4(n1945), .A5(n2319), .A6(n1945), .Y(n1946) );
  AO21X1_RVT U1576 ( .A1(sampled_angle[8]), .A2(n2318), .A3(n1946), .Y(n1947)
         );
  AO22X1_RVT U1577 ( .A1(n1948), .A2(n1947), .A3(sampled_angle[9]), .A4(n2336), 
        .Y(n1949) );
  AO222X1_RVT U1578 ( .A1(sampled_angle[10]), .A2(n1949), .A3(
        sampled_angle[10]), .A4(n2343), .A5(n1949), .A6(n2343), .Y(n1950) );
  AO222X1_RVT U1579 ( .A1(sampled_angle[11]), .A2(n2342), .A3(
        sampled_angle[11]), .A4(n1950), .A5(n2342), .A6(n1950), .Y(n1952) );
  AO22X1_RVT U1580 ( .A1(sampled_angle[15]), .A2(n2350), .A3(sampled_angle[14]), .A4(n2330), .Y(n1951) );
  AO221X1_RVT U1581 ( .A1(n1954), .A2(n1953), .A3(n1954), .A4(n1952), .A5(
        n1951), .Y(n1955) );
  NAND3X0_RVT U1582 ( .A1(n1957), .A2(n1956), .A3(n1955), .Y(n2131) );
  INVX0_RVT U1583 ( .A(n2131), .Y(n2278) );
  INVX0_RVT U1584 ( .A(n2278), .Y(n2291) );
  NAND2X0_RVT U1585 ( .A1(n2323), .A2(n2340), .Y(n1965) );
  NAND3X0_RVT U1586 ( .A1(state[2]), .A2(state[1]), .A3(state[3]), .Y(n1992)
         );
  AO222X1_RVT U1587 ( .A1(n2308), .A2(state[3]), .A3(n2308), .A4(n1965), .A5(
        state[0]), .A6(n1992), .Y(n1960) );
  NAND2X0_RVT U1588 ( .A1(n2291), .A2(n1960), .Y(n2017) );
  NAND3X0_RVT U1589 ( .A1(state[1]), .A2(n2323), .A3(n2312), .Y(n2015) );
  NAND3X0_RVT U1590 ( .A1(state[2]), .A2(n2340), .A3(n2312), .Y(n1976) );
  INVX0_RVT U1591 ( .A(n1976), .Y(n1968) );
  NAND2X0_RVT U1592 ( .A1(n1968), .A2(n2308), .Y(n2279) );
  NAND2X0_RVT U1593 ( .A1(n2015), .A2(n2279), .Y(n1958) );
  MUX21X1_RVT U1594 ( .A1(n2017), .A2(n2291), .S0(n1958), .Y(\intadd_2/CI ) );
  INVX0_RVT U1595 ( .A(n1965), .Y(n2022) );
  NAND2X0_RVT U1596 ( .A1(state[2]), .A2(n2312), .Y(n1972) );
  NAND3X0_RVT U1597 ( .A1(state[3]), .A2(n2022), .A3(n2308), .Y(n2245) );
  NAND3X0_RVT U1598 ( .A1(n2270), .A2(n1972), .A3(n2245), .Y(n1961) );
  INVX0_RVT U1599 ( .A(n2131), .Y(n2146) );
  INVX0_RVT U1600 ( .A(n1961), .Y(n1959) );
  OAI222X1_RVT U1601 ( .A1(n1961), .A2(n2291), .A3(n1961), .A4(n1960), .A5(
        n2146), .A6(n1959), .Y(n2004) );
  AO222X1_RVT U1602 ( .A1(\intadd_3/n1 ), .A2(n2319), .A3(\intadd_3/n1 ), .A4(
        n2004), .A5(n2319), .A6(n2004), .Y(n2007) );
  NAND2X0_RVT U1603 ( .A1(n1965), .A2(n2312), .Y(n1979) );
  INVX0_RVT U1604 ( .A(n1979), .Y(n1962) );
  INVX0_RVT U1605 ( .A(n2278), .Y(n2301) );
  AO22X1_RVT U1606 ( .A1(n1962), .A2(n2301), .A3(n1979), .A4(n2017), .Y(n2006)
         );
  NAND4X0_RVT U1607 ( .A1(state[1]), .A2(state[2]), .A3(n2312), .A4(n2308), 
        .Y(n2262) );
  NAND3X0_RVT U1608 ( .A1(n2015), .A2(n1976), .A3(n1935), .Y(n1963) );
  MUX21X1_RVT U1609 ( .A1(n2017), .A2(n2291), .S0(n1963), .Y(n2009) );
  AO222X1_RVT U1610 ( .A1(n2010), .A2(n2336), .A3(n2010), .A4(n2009), .A5(
        n2336), .A6(n2009), .Y(n2013) );
  INVX0_RVT U1611 ( .A(n2015), .Y(n2016) );
  NAND2X0_RVT U1612 ( .A1(state[0]), .A2(n2016), .Y(n2280) );
  NAND3X0_RVT U1613 ( .A1(n1976), .A2(n2270), .A3(n2280), .Y(n1964) );
  MUX21X1_RVT U1614 ( .A1(n2017), .A2(n2301), .S0(n1964), .Y(n2012) );
  AO222X1_RVT U1615 ( .A1(n2013), .A2(n2343), .A3(n2013), .A4(n2012), .A5(
        n2343), .A6(n2012), .Y(\intadd_2/B[0] ) );
  NAND2X0_RVT U1616 ( .A1(state[2]), .A2(state[1]), .Y(n1990) );
  NAND4X0_RVT U1617 ( .A1(state[1]), .A2(state[3]), .A3(n2323), .A4(n2308), 
        .Y(n2223) );
  OA221X1_RVT U1618 ( .A1(state[3]), .A2(n1990), .A3(n2312), .A4(n1965), .A5(
        n2223), .Y(n1977) );
  NAND4X0_RVT U1619 ( .A1(state[1]), .A2(state[3]), .A3(state[0]), .A4(n2323), 
        .Y(n2187) );
  NAND3X0_RVT U1620 ( .A1(state[2]), .A2(state[3]), .A3(n2340), .Y(n2020) );
  AND4X1_RVT U1621 ( .A1(n1977), .A2(n2270), .A3(n2187), .A4(n2020), .Y(n1970)
         );
  OR2X1_RVT U1622 ( .A1(state[0]), .A2(n1992), .Y(n2173) );
  NAND4X0_RVT U1623 ( .A1(n1970), .A2(n2280), .A3(n2279), .A4(n2173), .Y(n1969) );
  NAND2X0_RVT U1624 ( .A1(n2291), .A2(n1969), .Y(n1967) );
  NAND2X0_RVT U1625 ( .A1(state[0]), .A2(n1968), .Y(n2269) );
  NAND2X0_RVT U1626 ( .A1(n1970), .A2(n2269), .Y(n1966) );
  MUX21X1_RVT U1627 ( .A1(n1967), .A2(n2291), .S0(n1966), .Y(n1996) );
  AO22X1_RVT U1628 ( .A1(n2146), .A2(n1969), .A3(n2301), .A4(n1968), .Y(n1994)
         );
  NAND4X0_RVT U1629 ( .A1(n1970), .A2(n2280), .A3(n2173), .A4(n2269), .Y(n1984) );
  NAND2X0_RVT U1630 ( .A1(inner_angle[0]), .A2(n1984), .Y(n1983) );
  INVX0_RVT U1631 ( .A(n1983), .Y(n1993) );
  INVX0_RVT U1632 ( .A(n1997), .Y(n1971) );
  AO222X1_RVT U1633 ( .A1(n2332), .A2(n1996), .A3(n2332), .A4(n1971), .A5(
        n1996), .A6(n1971), .Y(n2000) );
  OA221X1_RVT U1634 ( .A1(state[3]), .A2(n2340), .A3(n2312), .A4(state[2]), 
        .A5(n2269), .Y(n2003) );
  NAND3X0_RVT U1635 ( .A1(state[2]), .A2(n2340), .A3(n2308), .Y(n1975) );
  AO22X1_RVT U1636 ( .A1(state[1]), .A2(n2308), .A3(n2340), .A4(state[0]), .Y(
        n1987) );
  NAND2X0_RVT U1637 ( .A1(state[3]), .A2(n2323), .Y(n1973) );
  NAND3X0_RVT U1638 ( .A1(n1987), .A2(n1973), .A3(n1972), .Y(n1974) );
  OA222X1_RVT U1639 ( .A1(n2291), .A2(n2003), .A3(n2301), .A4(n1975), .A5(
        n2146), .A6(n1974), .Y(n1999) );
  AO222X1_RVT U1640 ( .A1(n2000), .A2(n2335), .A3(n2000), .A4(n1999), .A5(
        n2335), .A6(n1999), .Y(\intadd_3/B[0] ) );
  NAND2X0_RVT U1641 ( .A1(n1977), .A2(n1976), .Y(n1978) );
  MUX21X1_RVT U1642 ( .A1(n2017), .A2(n2291), .S0(n1978), .Y(\intadd_3/B[1] )
         );
  NAND2X0_RVT U1643 ( .A1(n2022), .A2(state[3]), .Y(n1980) );
  NAND2X0_RVT U1644 ( .A1(n1980), .A2(n1979), .Y(n1981) );
  MUX21X1_RVT U1645 ( .A1(n2017), .A2(n2291), .S0(n1981), .Y(\intadd_3/B[2] )
         );
  NAND2X0_RVT U1646 ( .A1(n2016), .A2(n2308), .Y(n2283) );
  NAND2X0_RVT U1647 ( .A1(n2270), .A2(n2283), .Y(n1982) );
  MUX21X1_RVT U1648 ( .A1(n2017), .A2(n2301), .S0(n1982), .Y(\intadd_2/B[2] )
         );
  AND2X1_RVT U1649 ( .A1(n2307), .A2(n1983), .Y(n1986) );
  OR2X1_RVT U1650 ( .A1(n1984), .A2(inner_angle[0]), .Y(n1985) );
  AND2X1_RVT U1651 ( .A1(n1986), .A2(n1985), .Y(N4) );
  AND2X1_RVT U1652 ( .A1(working), .A2(n2307), .Y(n2295) );
  AND2X1_RVT U1653 ( .A1(n1987), .A2(n2295), .Y(N33) );
  AND2X1_RVT U1654 ( .A1(n2295), .A2(n2308), .Y(N32) );
  NAND2X0_RVT U1655 ( .A1(state[1]), .A2(state[0]), .Y(n1988) );
  INVX0_RVT U1656 ( .A(n1988), .Y(n1989) );
  NBUFFX2_RVT U1657 ( .A(n2295), .Y(n2306) );
  OA221X1_RVT U1658 ( .A1(state[2]), .A2(n1989), .A3(n2323), .A4(n1988), .A5(
        n2306), .Y(N34) );
  OA21X1_RVT U1659 ( .A1(n1990), .A2(n2308), .A3(n2306), .Y(n1991) );
  OR3X1_RVT U1660 ( .A1(n2308), .A2(n1990), .A3(state[3]), .Y(n2253) );
  INVX0_RVT U1661 ( .A(n2253), .Y(n2236) );
  AO22X1_RVT U1662 ( .A1(state[3]), .A2(n1991), .A3(n2295), .A4(n2236), .Y(N35) );
  AO221X1_RVT U1663 ( .A1(working), .A2(n1992), .A3(working), .A4(n2308), .A5(
        start), .Y(N23) );
  FADDX1_RVT U1664 ( .A(inner_angle[1]), .B(n1994), .CI(n1993), .CO(n1997), 
        .S(n1995) );
  AND2X1_RVT U1665 ( .A1(n1995), .A2(n2307), .Y(N5) );
  FADDX1_RVT U1666 ( .A(n1997), .B(n2332), .CI(n1996), .S(n1998) );
  AND2X1_RVT U1667 ( .A1(n1998), .A2(n2307), .Y(N6) );
  FADDX1_RVT U1668 ( .A(inner_angle[3]), .B(n2000), .CI(n1999), .S(n2001) );
  AND2X1_RVT U1669 ( .A1(n2307), .A2(n2001), .Y(N7) );
  INVX0_RVT U1670 ( .A(n2003), .Y(n2002) );
  AO22X1_RVT U1671 ( .A1(n2003), .A2(n2017), .A3(n2002), .A4(n2291), .Y(
        \intadd_3/CI ) );
  NOR2X0_RVT U1672 ( .A1(start), .A2(\intadd_3/SUM[0] ), .Y(N8) );
  NOR2X0_RVT U1673 ( .A1(start), .A2(\intadd_3/SUM[1] ), .Y(N9) );
  NOR2X0_RVT U1674 ( .A1(start), .A2(\intadd_3/SUM[2] ), .Y(N10) );
  FADDX1_RVT U1675 ( .A(\intadd_3/n1 ), .B(n2004), .CI(inner_angle[7]), .S(
        n2005) );
  AND2X1_RVT U1676 ( .A1(n2005), .A2(n2307), .Y(N11) );
  FADDX1_RVT U1677 ( .A(n2318), .B(n2007), .CI(n2006), .CO(n2010), .S(n2008)
         );
  NOR2X0_RVT U1678 ( .A1(start), .A2(n2008), .Y(N12) );
  FADDX1_RVT U1679 ( .A(n2010), .B(inner_angle[9]), .CI(n2009), .S(n2011) );
  AND2X1_RVT U1680 ( .A1(n2011), .A2(n2307), .Y(N13) );
  FADDX1_RVT U1681 ( .A(inner_angle[10]), .B(n2013), .CI(n2012), .S(n2014) );
  AND2X1_RVT U1682 ( .A1(n2307), .A2(n2014), .Y(N14) );
  NOR2X0_RVT U1683 ( .A1(start), .A2(\intadd_2/SUM[0] ), .Y(N15) );
  AO22X1_RVT U1684 ( .A1(n2016), .A2(n2301), .A3(n2015), .A4(n2017), .Y(
        \intadd_2/B[1] ) );
  NOR2X0_RVT U1685 ( .A1(start), .A2(\intadd_2/SUM[1] ), .Y(N16) );
  NOR2X0_RVT U1686 ( .A1(start), .A2(\intadd_2/SUM[2] ), .Y(N17) );
  INVX0_RVT U1687 ( .A(n2270), .Y(n2296) );
  AO22X1_RVT U1688 ( .A1(n2296), .A2(n2301), .A3(n2270), .A4(n2017), .Y(
        \intadd_2/B[3] ) );
  NOR2X0_RVT U1689 ( .A1(start), .A2(\intadd_2/SUM[3] ), .Y(N18) );
  XOR2X1_RVT U1690 ( .A1(n2017), .A2(inner_angle[15]), .Y(n2018) );
  XOR2X1_RVT U1691 ( .A1(\intadd_2/n2 ), .A2(n2018), .Y(n2019) );
  AND2X1_RVT U1692 ( .A1(n2019), .A2(n2307), .Y(N19) );
  INVX0_RVT U1693 ( .A(n2020), .Y(n2021) );
  NAND2X0_RVT U1694 ( .A1(state[0]), .A2(n2021), .Y(n2186) );
  INVX0_RVT U1695 ( .A(n2186), .Y(n2172) );
  NAND2X0_RVT U1696 ( .A1(n2021), .A2(n2308), .Y(n2200) );
  INVX0_RVT U1697 ( .A(n2200), .Y(n2185) );
  AO22X1_RVT U1698 ( .A1(sin[12]), .A2(n2172), .A3(sin[11]), .A4(n2185), .Y(
        n2030) );
  INVX0_RVT U1699 ( .A(n2280), .Y(n2289) );
  INVX0_RVT U1700 ( .A(n2187), .Y(n2211) );
  AO22X1_RVT U1701 ( .A1(n2289), .A2(sin[2]), .A3(n2211), .A4(sin[10]), .Y(
        n2029) );
  INVX0_RVT U1702 ( .A(n2269), .Y(n2235) );
  INVX0_RVT U1703 ( .A(n2283), .Y(n2294) );
  AO22X1_RVT U1704 ( .A1(n2235), .A2(sin[4]), .A3(n2294), .A4(sin[1]), .Y(
        n2028) );
  OA22X1_RVT U1705 ( .A1(n1935), .A2(n2349), .A3(n2223), .A4(n2314), .Y(n2026)
         );
  OA22X1_RVT U1706 ( .A1(n2270), .A2(n2352), .A3(n2253), .A4(n2328), .Y(n2025)
         );
  NAND3X0_RVT U1707 ( .A1(n2022), .A2(state[3]), .A3(state[0]), .Y(n2199) );
  OA22X1_RVT U1708 ( .A1(n2173), .A2(n2339), .A3(n2324), .A4(n2199), .Y(n2024)
         );
  INVX0_RVT U1709 ( .A(n2279), .Y(n2254) );
  INVX0_RVT U1710 ( .A(n2245), .Y(n2233) );
  AOI22X1_RVT U1711 ( .A1(n2254), .A2(sin[3]), .A3(n2233), .A4(sin[7]), .Y(
        n2023) );
  NAND4X0_RVT U1712 ( .A1(n2026), .A2(n2025), .A3(n2024), .A4(n2023), .Y(n2027) );
  NOR4X1_RVT U1713 ( .A1(n2030), .A2(n2029), .A3(n2028), .A4(n2027), .Y(n2043)
         );
  INVX0_RVT U1714 ( .A(n2043), .Y(n2042) );
  NAND2X0_RVT U1715 ( .A1(working), .A2(n2042), .Y(n2031) );
  INVX0_RVT U1716 ( .A(n2031), .Y(n2032) );
  OA221X1_RVT U1717 ( .A1(cos[0]), .A2(n2032), .A3(n2351), .A4(n2031), .A5(
        n2307), .Y(n1933) );
  NAND2X0_RVT U1718 ( .A1(n2042), .A2(n2146), .Y(n2041) );
  AO22X1_RVT U1719 ( .A1(sin[13]), .A2(n2172), .A3(sin[12]), .A4(n2185), .Y(
        n2040) );
  AO22X1_RVT U1720 ( .A1(n2289), .A2(sin[3]), .A3(n2211), .A4(sin[11]), .Y(
        n2039) );
  AO22X1_RVT U1721 ( .A1(n2235), .A2(sin[5]), .A3(n2294), .A4(sin[2]), .Y(
        n2038) );
  OA22X1_RVT U1722 ( .A1(n1935), .A2(n2328), .A3(n2223), .A4(n2313), .Y(n2036)
         );
  AOI22X1_RVT U1723 ( .A1(n2296), .A2(sin[1]), .A3(n2236), .A4(sin[7]), .Y(
        n2035) );
  OA22X1_RVT U1724 ( .A1(n2173), .A2(n2322), .A3(n2314), .A4(n2199), .Y(n2034)
         );
  OA22X1_RVT U1725 ( .A1(n2279), .A2(n2347), .A3(n2324), .A4(n2245), .Y(n2033)
         );
  NAND4X0_RVT U1726 ( .A1(n2036), .A2(n2035), .A3(n2034), .A4(n2033), .Y(n2037) );
  NOR4X1_RVT U1727 ( .A1(n2040), .A2(n2039), .A3(n2038), .A4(n2037), .Y(n2044)
         );
  HADDX1_RVT U1728 ( .A0(n2041), .B0(n2044), .SO(\intadd_1/B[0] ) );
  AND2X1_RVT U1729 ( .A1(cos[0]), .A2(n2042), .Y(\intadd_1/CI ) );
  AO221X1_RVT U1730 ( .A1(working), .A2(\intadd_1/SUM[0] ), .A3(n2331), .A4(
        cos[1]), .A5(start), .Y(n1932) );
  AND2X1_RVT U1731 ( .A1(n2044), .A2(n2043), .Y(n2054) );
  OR2X1_RVT U1732 ( .A1(n2054), .A2(n2291), .Y(n2053) );
  AO22X1_RVT U1733 ( .A1(sin[14]), .A2(n2172), .A3(sin[13]), .A4(n2185), .Y(
        n2052) );
  AO22X1_RVT U1734 ( .A1(n2289), .A2(sin[4]), .A3(n2211), .A4(sin[12]), .Y(
        n2051) );
  AO22X1_RVT U1735 ( .A1(n2235), .A2(sin[6]), .A3(n2294), .A4(sin[3]), .Y(
        n2050) );
  OA22X1_RVT U1736 ( .A1(n2262), .A2(n2344), .A3(n2223), .A4(n2320), .Y(n2048)
         );
  AOI22X1_RVT U1737 ( .A1(n2296), .A2(sin[2]), .A3(sin[8]), .A4(n2236), .Y(
        n2047) );
  OA22X1_RVT U1738 ( .A1(n2173), .A2(n2309), .A3(n2313), .A4(n2199), .Y(n2046)
         );
  OA22X1_RVT U1739 ( .A1(n2279), .A2(n2349), .A3(n2314), .A4(n2245), .Y(n2045)
         );
  NAND4X0_RVT U1740 ( .A1(n2048), .A2(n2047), .A3(n2046), .A4(n2045), .Y(n2049) );
  NOR4X1_RVT U1741 ( .A1(n2052), .A2(n2051), .A3(n2050), .A4(n2049), .Y(n2055)
         );
  HADDX1_RVT U1742 ( .A0(n2053), .B0(n2055), .SO(\intadd_1/B[1] ) );
  AO22X1_RVT U1743 ( .A1(n2306), .A2(\intadd_1/SUM[1] ), .A3(n2304), .A4(
        cos[2]), .Y(n1931) );
  AND2X1_RVT U1744 ( .A1(n2055), .A2(n2054), .Y(n2065) );
  OR2X1_RVT U1745 ( .A1(n2065), .A2(n2301), .Y(n2064) );
  INVX0_RVT U1746 ( .A(n2199), .Y(n2234) );
  AO22X1_RVT U1747 ( .A1(sin[14]), .A2(n2185), .A3(sin[11]), .A4(n2234), .Y(
        n2063) );
  AO22X1_RVT U1748 ( .A1(n2254), .A2(sin[6]), .A3(sin[10]), .A4(n2233), .Y(
        n2062) );
  AO22X1_RVT U1749 ( .A1(n2289), .A2(sin[5]), .A3(n2235), .A4(sin[7]), .Y(
        n2061) );
  OA22X1_RVT U1750 ( .A1(n2309), .A2(n2186), .A3(n2314), .A4(n2253), .Y(n2059)
         );
  OA22X1_RVT U1751 ( .A1(n2187), .A2(n2339), .A3(n2223), .A4(n2315), .Y(n2058)
         );
  OA22X1_RVT U1752 ( .A1(n1935), .A2(n2324), .A3(n2283), .A4(n2347), .Y(n2057)
         );
  NAND2X0_RVT U1753 ( .A1(n2296), .A2(sin[3]), .Y(n2056) );
  NAND4X0_RVT U1754 ( .A1(n2059), .A2(n2058), .A3(n2057), .A4(n2056), .Y(n2060) );
  NOR4X1_RVT U1755 ( .A1(n2063), .A2(n2062), .A3(n2061), .A4(n2060), .Y(n2066)
         );
  HADDX1_RVT U1756 ( .A0(n2064), .B0(n2066), .SO(\intadd_1/B[2] ) );
  AO221X1_RVT U1757 ( .A1(working), .A2(\intadd_1/SUM[2] ), .A3(n2331), .A4(
        cos[3]), .A5(start), .Y(n1930) );
  AND2X1_RVT U1758 ( .A1(n2066), .A2(n2065), .Y(n2075) );
  OR2X1_RVT U1759 ( .A1(n2075), .A2(n2291), .Y(n2074) );
  AO22X1_RVT U1760 ( .A1(n2235), .A2(sin[8]), .A3(sin[11]), .A4(n2233), .Y(
        n2073) );
  AO22X1_RVT U1761 ( .A1(n2254), .A2(sin[7]), .A3(n2211), .A4(sin[14]), .Y(
        n2072) );
  AO22X1_RVT U1762 ( .A1(n2289), .A2(sin[6]), .A3(n2294), .A4(sin[5]), .Y(
        n2071) );
  OA22X1_RVT U1763 ( .A1(n2309), .A2(n2200), .A3(n2315), .A4(n2199), .Y(n2069)
         );
  OA22X1_RVT U1764 ( .A1(n2223), .A2(n2339), .A3(n2313), .A4(n2253), .Y(n2068)
         );
  NAND3X0_RVT U1765 ( .A1(n2069), .A2(n2068), .A3(n2067), .Y(n2070) );
  NOR4X1_RVT U1766 ( .A1(n2073), .A2(n2072), .A3(n2071), .A4(n2070), .Y(n2076)
         );
  HADDX1_RVT U1767 ( .A0(n2074), .B0(n2076), .SO(\intadd_1/B[3] ) );
  AO221X1_RVT U1768 ( .A1(working), .A2(\intadd_1/SUM[3] ), .A3(n2331), .A4(
        cos[4]), .A5(start), .Y(n1929) );
  NAND2X0_RVT U1769 ( .A1(n2076), .A2(n2075), .Y(n2085) );
  AND2X1_RVT U1770 ( .A1(n2085), .A2(n2146), .Y(n2084) );
  OA22X1_RVT U1771 ( .A1(n2283), .A2(n2328), .A3(n2315), .A4(n2245), .Y(n2080)
         );
  OA22X1_RVT U1772 ( .A1(n2279), .A2(n2324), .A3(n2339), .A4(n2199), .Y(n2079)
         );
  OA22X1_RVT U1773 ( .A1(n2262), .A2(n2313), .A3(n2320), .A4(n2253), .Y(n2078)
         );
  OA22X1_RVT U1774 ( .A1(n2280), .A2(n2344), .A3(n2187), .A4(n2309), .Y(n2077)
         );
  AND4X1_RVT U1775 ( .A1(n2080), .A2(n2079), .A3(n2078), .A4(n2077), .Y(n2083)
         );
  INVX0_RVT U1776 ( .A(n2223), .Y(n2212) );
  AOI22X1_RVT U1777 ( .A1(n2212), .A2(sin[14]), .A3(n2235), .A4(sin[9]), .Y(
        n2082) );
  NAND2X0_RVT U1778 ( .A1(n2296), .A2(sin[5]), .Y(n2081) );
  NAND3X0_RVT U1779 ( .A1(n2083), .A2(n2082), .A3(n2081), .Y(n2086) );
  HADDX1_RVT U1780 ( .A0(n2084), .B0(n2086), .SO(\intadd_1/B[4] ) );
  AO221X1_RVT U1781 ( .A1(working), .A2(\intadd_1/SUM[4] ), .A3(n2331), .A4(
        cos[5]), .A5(start), .Y(n1928) );
  NOR2X0_RVT U1782 ( .A1(n2086), .A2(n2085), .Y(n2094) );
  OR2X1_RVT U1783 ( .A1(n2094), .A2(n2301), .Y(n2093) );
  AO22X1_RVT U1784 ( .A1(sin[14]), .A2(n2234), .A3(sin[13]), .A4(n2233), .Y(
        n2092) );
  AO22X1_RVT U1785 ( .A1(n2254), .A2(sin[9]), .A3(n2235), .A4(sin[10]), .Y(
        n2091) );
  AO22X1_RVT U1786 ( .A1(n2289), .A2(sin[8]), .A3(n2294), .A4(sin[7]), .Y(
        n2090) );
  OA22X1_RVT U1787 ( .A1(n2270), .A2(n2328), .A3(n2223), .A4(n2309), .Y(n2088)
         );
  OA22X1_RVT U1788 ( .A1(n2262), .A2(n2320), .A3(n2315), .A4(n2253), .Y(n2087)
         );
  NAND2X0_RVT U1789 ( .A1(n2088), .A2(n2087), .Y(n2089) );
  NOR4X1_RVT U1790 ( .A1(n2092), .A2(n2091), .A3(n2090), .A4(n2089), .Y(n2095)
         );
  HADDX1_RVT U1791 ( .A0(n2093), .B0(n2095), .SO(\intadd_1/B[5] ) );
  AO22X1_RVT U1792 ( .A1(n2306), .A2(\intadd_1/SUM[5] ), .A3(n2304), .A4(
        cos[6]), .Y(n1927) );
  AND2X1_RVT U1793 ( .A1(n2095), .A2(n2094), .Y(n2103) );
  OR2X1_RVT U1794 ( .A1(n2103), .A2(n2291), .Y(n2101) );
  OA22X1_RVT U1795 ( .A1(n2270), .A2(n2344), .A3(n2322), .A4(n2245), .Y(n2100)
         );
  OA22X1_RVT U1796 ( .A1(n2279), .A2(n2313), .A3(n2309), .A4(n2199), .Y(n2099)
         );
  OA22X1_RVT U1797 ( .A1(n2280), .A2(n2314), .A3(n2269), .A4(n2320), .Y(n2098)
         );
  OA22X1_RVT U1798 ( .A1(n2283), .A2(n2324), .A3(n2339), .A4(n2253), .Y(n2096)
         );
  OA21X1_RVT U1799 ( .A1(n2262), .A2(n2315), .A3(n2096), .Y(n2097) );
  AND4X1_RVT U1800 ( .A1(n2100), .A2(n2099), .A3(n2098), .A4(n2097), .Y(n2102)
         );
  HADDX1_RVT U1801 ( .A0(n2101), .B0(n2102), .SO(\intadd_1/B[6] ) );
  AO221X1_RVT U1802 ( .A1(working), .A2(\intadd_1/SUM[6] ), .A3(n2331), .A4(
        cos[7]), .A5(start), .Y(n1926) );
  AND2X1_RVT U1803 ( .A1(n2103), .A2(n2102), .Y(n2109) );
  OR2X1_RVT U1804 ( .A1(n2109), .A2(n2291), .Y(n2108) );
  OA22X1_RVT U1805 ( .A1(n1935), .A2(n2339), .A3(n2270), .A4(n2324), .Y(n2107)
         );
  OA22X1_RVT U1806 ( .A1(n2283), .A2(n2314), .A3(n2322), .A4(n2253), .Y(n2106)
         );
  OA22X1_RVT U1807 ( .A1(n2280), .A2(n2313), .A3(n2279), .A4(n2320), .Y(n2105)
         );
  OA22X1_RVT U1808 ( .A1(n2269), .A2(n2315), .A3(n2309), .A4(n2245), .Y(n2104)
         );
  AND4X1_RVT U1809 ( .A1(n2107), .A2(n2106), .A3(n2105), .A4(n2104), .Y(n2110)
         );
  HADDX1_RVT U1810 ( .A0(n2108), .B0(n2110), .SO(\intadd_1/B[7] ) );
  AO221X1_RVT U1811 ( .A1(working), .A2(\intadd_1/SUM[7] ), .A3(n2331), .A4(
        cos[8]), .A5(start), .Y(n1925) );
  AND2X1_RVT U1812 ( .A1(n2110), .A2(n2109), .Y(n2117) );
  OR2X1_RVT U1813 ( .A1(n2117), .A2(n2301), .Y(n2115) );
  OA22X1_RVT U1814 ( .A1(n2270), .A2(n2314), .A3(n2309), .A4(n2253), .Y(n2114)
         );
  OA22X1_RVT U1815 ( .A1(n2262), .A2(n2322), .A3(n2283), .A4(n2313), .Y(n2113)
         );
  OA22X1_RVT U1816 ( .A1(n2280), .A2(n2320), .A3(n2269), .A4(n2339), .Y(n2112)
         );
  NAND2X0_RVT U1817 ( .A1(n2254), .A2(sin[12]), .Y(n2111) );
  AND4X1_RVT U1818 ( .A1(n2114), .A2(n2113), .A3(n2112), .A4(n2111), .Y(n2116)
         );
  HADDX1_RVT U1819 ( .A0(n2115), .B0(n2116), .SO(\intadd_1/B[8] ) );
  AO22X1_RVT U1820 ( .A1(n2306), .A2(\intadd_1/SUM[8] ), .A3(n2304), .A4(
        cos[9]), .Y(n1924) );
  AND2X1_RVT U1821 ( .A1(n2117), .A2(n2116), .Y(n2122) );
  OR2X1_RVT U1822 ( .A1(n2122), .A2(n2301), .Y(n2121) );
  OA22X1_RVT U1823 ( .A1(n1935), .A2(n2309), .A3(n2270), .A4(n2313), .Y(n2120)
         );
  OA22X1_RVT U1824 ( .A1(n2280), .A2(n2315), .A3(n2283), .A4(n2320), .Y(n2119)
         );
  OA22X1_RVT U1825 ( .A1(n2279), .A2(n2339), .A3(n2269), .A4(n2322), .Y(n2118)
         );
  AND3X1_RVT U1826 ( .A1(n2120), .A2(n2119), .A3(n2118), .Y(n2123) );
  HADDX1_RVT U1827 ( .A0(n2121), .B0(n2123), .SO(\intadd_1/B[9] ) );
  AO221X1_RVT U1828 ( .A1(working), .A2(\intadd_1/SUM[9] ), .A3(n2331), .A4(
        cos[10]), .A5(start), .Y(n1923) );
  AND2X1_RVT U1829 ( .A1(n2123), .A2(n2122), .Y(n2129) );
  OR2X1_RVT U1830 ( .A1(n2129), .A2(n2131), .Y(n2128) );
  OA22X1_RVT U1831 ( .A1(n2279), .A2(n2322), .A3(n2269), .A4(n2309), .Y(n2125)
         );
  OA22X1_RVT U1832 ( .A1(n2270), .A2(n2320), .A3(n2280), .A4(n2339), .Y(n2124)
         );
  AND2X1_RVT U1833 ( .A1(n2125), .A2(n2124), .Y(n2127) );
  OR2X1_RVT U1834 ( .A1(n2315), .A2(n2283), .Y(n2126) );
  AND2X1_RVT U1835 ( .A1(n2127), .A2(n2126), .Y(n2130) );
  HADDX1_RVT U1836 ( .A0(n2128), .B0(n2130), .SO(\intadd_1/B[10] ) );
  AO221X1_RVT U1837 ( .A1(working), .A2(\intadd_1/SUM[10] ), .A3(n2331), .A4(
        cos[11]), .A5(start), .Y(n1922) );
  AND2X1_RVT U1838 ( .A1(n2130), .A2(n2129), .Y(n2137) );
  OR2X1_RVT U1839 ( .A1(n2137), .A2(n2131), .Y(n2136) );
  NAND2X0_RVT U1840 ( .A1(n2294), .A2(sin[13]), .Y(n2133) );
  OA22X1_RVT U1841 ( .A1(n2280), .A2(n2322), .A3(n2279), .A4(n2309), .Y(n2132)
         );
  AND2X1_RVT U1842 ( .A1(n2133), .A2(n2132), .Y(n2135) );
  OR2X1_RVT U1843 ( .A1(n2315), .A2(n2270), .Y(n2134) );
  AND2X1_RVT U1844 ( .A1(n2135), .A2(n2134), .Y(n2138) );
  HADDX1_RVT U1845 ( .A0(n2136), .B0(n2138), .SO(\intadd_1/B[11] ) );
  AO22X1_RVT U1846 ( .A1(n2306), .A2(\intadd_1/SUM[11] ), .A3(n2304), .A4(
        cos[12]), .Y(n1921) );
  NAND2X0_RVT U1847 ( .A1(n2138), .A2(n2137), .Y(n2140) );
  AND2X1_RVT U1848 ( .A1(n2140), .A2(n2146), .Y(n2139) );
  AO222X1_RVT U1849 ( .A1(n2296), .A2(sin[13]), .A3(sin[15]), .A4(n2289), .A5(
        sin[14]), .A6(n2294), .Y(n2141) );
  HADDX1_RVT U1850 ( .A0(n2139), .B0(n2141), .SO(\intadd_1/B[12] ) );
  AO22X1_RVT U1851 ( .A1(n2306), .A2(\intadd_1/SUM[12] ), .A3(n2304), .A4(
        cos[13]), .Y(n1920) );
  OA21X1_RVT U1852 ( .A1(n2141), .A2(n2140), .A3(n2146), .Y(n2144) );
  AO22X1_RVT U1853 ( .A1(n2296), .A2(sin[14]), .A3(sin[15]), .A4(n2294), .Y(
        n2145) );
  HADDX1_RVT U1854 ( .A0(n2144), .B0(n2145), .SO(\intadd_1/B[13] ) );
  AO221X1_RVT U1855 ( .A1(working), .A2(\intadd_1/SUM[13] ), .A3(n2331), .A4(
        cos[14]), .A5(start), .Y(n1919) );
  NAND2X0_RVT U1856 ( .A1(n2296), .A2(sin[15]), .Y(n2142) );
  XOR2X1_RVT U1857 ( .A1(n2311), .A2(n2142), .Y(n2143) );
  XOR2X1_RVT U1858 ( .A1(\intadd_1/n2 ), .A2(n2143), .Y(n2148) );
  AO21X1_RVT U1859 ( .A1(n2146), .A2(n2145), .A3(n2144), .Y(n2147) );
  HADDX1_RVT U1860 ( .A0(n2148), .B0(n2147), .SO(n2149) );
  AO22X1_RVT U1861 ( .A1(n2306), .A2(n2149), .A3(cos[15]), .A4(n2304), .Y(
        n1918) );
  AO22X1_RVT U1862 ( .A1(n2185), .A2(cos[11]), .A3(n2172), .A4(cos[12]), .Y(
        n2157) );
  AO22X1_RVT U1863 ( .A1(n2289), .A2(cos[2]), .A3(n2211), .A4(cos[10]), .Y(
        n2156) );
  AO22X1_RVT U1864 ( .A1(n2235), .A2(cos[4]), .A3(n2294), .A4(cos[1]), .Y(
        n2155) );
  OA22X1_RVT U1865 ( .A1(n1935), .A2(n2348), .A3(n2223), .A4(n2321), .Y(n2153)
         );
  OA22X1_RVT U1866 ( .A1(n2270), .A2(n2351), .A3(n2253), .A4(n2329), .Y(n2152)
         );
  OA22X1_RVT U1867 ( .A1(n2173), .A2(n2310), .A3(n2199), .A4(n2327), .Y(n2151)
         );
  AOI22X1_RVT U1868 ( .A1(n2254), .A2(cos[3]), .A3(n2233), .A4(cos[7]), .Y(
        n2150) );
  NAND4X0_RVT U1869 ( .A1(n2153), .A2(n2152), .A3(n2151), .A4(n2150), .Y(n2154) );
  NOR4X1_RVT U1870 ( .A1(n2157), .A2(n2156), .A3(n2155), .A4(n2154), .Y(n2171)
         );
  INVX0_RVT U1871 ( .A(n2171), .Y(n2169) );
  NAND2X0_RVT U1872 ( .A1(working), .A2(n2169), .Y(n2158) );
  INVX0_RVT U1873 ( .A(n2158), .Y(n2159) );
  OA221X1_RVT U1874 ( .A1(sin[0]), .A2(n2159), .A3(n2352), .A4(n2158), .A5(
        n2307), .Y(n1917) );
  NAND2X0_RVT U1875 ( .A1(n2169), .A2(n2291), .Y(n2168) );
  AO22X1_RVT U1876 ( .A1(n2185), .A2(cos[12]), .A3(n2172), .A4(cos[13]), .Y(
        n2167) );
  AO22X1_RVT U1877 ( .A1(n2289), .A2(cos[3]), .A3(n2211), .A4(cos[11]), .Y(
        n2166) );
  AO22X1_RVT U1878 ( .A1(n2235), .A2(cos[5]), .A3(n2294), .A4(cos[2]), .Y(
        n2165) );
  OA22X1_RVT U1879 ( .A1(n1935), .A2(n2329), .A3(n2223), .A4(n2316), .Y(n2163)
         );
  AOI22X1_RVT U1880 ( .A1(n2296), .A2(cos[1]), .A3(n2236), .A4(cos[7]), .Y(
        n2162) );
  OA22X1_RVT U1881 ( .A1(n2173), .A2(n2341), .A3(n2199), .A4(n2321), .Y(n2161)
         );
  OA22X1_RVT U1882 ( .A1(n2279), .A2(n2346), .A3(n2245), .A4(n2327), .Y(n2160)
         );
  NAND4X0_RVT U1883 ( .A1(n2163), .A2(n2162), .A3(n2161), .A4(n2160), .Y(n2164) );
  NOR4X1_RVT U1884 ( .A1(n2167), .A2(n2166), .A3(n2165), .A4(n2164), .Y(n2170)
         );
  HADDX1_RVT U1885 ( .A0(n2168), .B0(n2170), .SO(\intadd_0/B[0] ) );
  AND2X1_RVT U1886 ( .A1(sin[0]), .A2(n2169), .Y(\intadd_0/CI ) );
  AO22X1_RVT U1887 ( .A1(n2306), .A2(\intadd_0/SUM[0] ), .A3(sin[1]), .A4(
        n2304), .Y(n1916) );
  AND2X1_RVT U1888 ( .A1(n2171), .A2(n2170), .Y(n2183) );
  OR2X1_RVT U1889 ( .A1(n2278), .A2(n2183), .Y(n2182) );
  AO22X1_RVT U1890 ( .A1(n2185), .A2(cos[13]), .A3(n2172), .A4(cos[14]), .Y(
        n2181) );
  AO22X1_RVT U1891 ( .A1(n2289), .A2(cos[4]), .A3(n2211), .A4(cos[12]), .Y(
        n2180) );
  AO22X1_RVT U1892 ( .A1(n2235), .A2(cos[6]), .A3(n2294), .A4(cos[3]), .Y(
        n2179) );
  AOI22X1_RVT U1893 ( .A1(n1934), .A2(cos[7]), .A3(n2212), .A4(cos[11]), .Y(
        n2177) );
  AOI22X1_RVT U1894 ( .A1(n2296), .A2(cos[2]), .A3(n2236), .A4(cos[8]), .Y(
        n2176) );
  OA22X1_RVT U1895 ( .A1(n2173), .A2(n2311), .A3(n2199), .A4(n2316), .Y(n2175)
         );
  OA22X1_RVT U1896 ( .A1(n2279), .A2(n2348), .A3(n2245), .A4(n2321), .Y(n2174)
         );
  NAND4X0_RVT U1897 ( .A1(n2177), .A2(n2176), .A3(n2175), .A4(n2174), .Y(n2178) );
  NOR4X1_RVT U1898 ( .A1(n2181), .A2(n2180), .A3(n2179), .A4(n2178), .Y(n2184)
         );
  HADDX1_RVT U1899 ( .A0(n2182), .B0(n2184), .SO(\intadd_0/B[1] ) );
  AO22X1_RVT U1900 ( .A1(n2306), .A2(\intadd_0/SUM[1] ), .A3(sin[2]), .A4(
        n2304), .Y(n1915) );
  AND2X1_RVT U1901 ( .A1(n2184), .A2(n2183), .Y(n2197) );
  OR2X1_RVT U1902 ( .A1(n2278), .A2(n2197), .Y(n2196) );
  AO22X1_RVT U1903 ( .A1(n2234), .A2(cos[11]), .A3(n2185), .A4(cos[14]), .Y(
        n2195) );
  AO22X1_RVT U1904 ( .A1(n2254), .A2(cos[6]), .A3(n2233), .A4(cos[10]), .Y(
        n2194) );
  AO22X1_RVT U1905 ( .A1(n2289), .A2(cos[5]), .A3(n2235), .A4(cos[7]), .Y(
        n2193) );
  OA22X1_RVT U1906 ( .A1(n2311), .A2(n2186), .A3(n2253), .A4(n2321), .Y(n2191)
         );
  OA22X1_RVT U1907 ( .A1(n2187), .A2(n2310), .A3(n2223), .A4(n2325), .Y(n2190)
         );
  OA22X1_RVT U1908 ( .A1(n2262), .A2(n2327), .A3(n2283), .A4(n2346), .Y(n2189)
         );
  NAND2X0_RVT U1909 ( .A1(n2296), .A2(cos[3]), .Y(n2188) );
  NAND4X0_RVT U1910 ( .A1(n2191), .A2(n2190), .A3(n2189), .A4(n2188), .Y(n2192) );
  NOR4X1_RVT U1911 ( .A1(n2195), .A2(n2194), .A3(n2193), .A4(n2192), .Y(n2198)
         );
  HADDX1_RVT U1912 ( .A0(n2196), .B0(n2198), .SO(\intadd_0/B[2] ) );
  AO22X1_RVT U1913 ( .A1(n2306), .A2(\intadd_0/SUM[2] ), .A3(sin[3]), .A4(
        n2304), .Y(n1914) );
  AND2X1_RVT U1914 ( .A1(n2198), .A2(n2197), .Y(n2209) );
  OR2X1_RVT U1915 ( .A1(n2278), .A2(n2209), .Y(n2208) );
  AO22X1_RVT U1916 ( .A1(n2235), .A2(cos[8]), .A3(n2233), .A4(cos[11]), .Y(
        n2207) );
  AO22X1_RVT U1917 ( .A1(n2254), .A2(cos[7]), .A3(n2211), .A4(cos[14]), .Y(
        n2206) );
  AO22X1_RVT U1918 ( .A1(n2289), .A2(cos[6]), .A3(n2294), .A4(cos[5]), .Y(
        n2205) );
  OA22X1_RVT U1919 ( .A1(n2311), .A2(n2200), .A3(n2199), .A4(n2325), .Y(n2203)
         );
  OA22X1_RVT U1920 ( .A1(n2223), .A2(n2310), .A3(n2253), .A4(n2316), .Y(n2202)
         );
  NAND3X0_RVT U1921 ( .A1(n2203), .A2(n2202), .A3(n2201), .Y(n2204) );
  NOR4X1_RVT U1922 ( .A1(n2207), .A2(n2206), .A3(n2205), .A4(n2204), .Y(n2210)
         );
  HADDX1_RVT U1923 ( .A0(n2208), .B0(n2210), .SO(\intadd_0/B[3] ) );
  AO22X1_RVT U1924 ( .A1(n2306), .A2(\intadd_0/SUM[3] ), .A3(sin[4]), .A4(
        n2304), .Y(n1913) );
  AND2X1_RVT U1925 ( .A1(n2210), .A2(n2209), .Y(n2221) );
  OR2X1_RVT U1926 ( .A1(n2278), .A2(n2221), .Y(n2220) );
  AO22X1_RVT U1927 ( .A1(n2294), .A2(cos[6]), .A3(n2233), .A4(cos[12]), .Y(
        n2219) );
  AO22X1_RVT U1928 ( .A1(n1934), .A2(cos[10]), .A3(n2236), .A4(cos[11]), .Y(
        n2218) );
  AO22X1_RVT U1929 ( .A1(n2289), .A2(cos[7]), .A3(n2211), .A4(cos[15]), .Y(
        n2217) );
  AOI22X1_RVT U1930 ( .A1(n2212), .A2(cos[14]), .A3(n2235), .A4(cos[9]), .Y(
        n2215) );
  AOI22X1_RVT U1931 ( .A1(n2254), .A2(cos[8]), .A3(n2234), .A4(cos[13]), .Y(
        n2214) );
  NAND2X0_RVT U1932 ( .A1(n2296), .A2(cos[5]), .Y(n2213) );
  NAND3X0_RVT U1933 ( .A1(n2215), .A2(n2214), .A3(n2213), .Y(n2216) );
  NOR4X1_RVT U1934 ( .A1(n2219), .A2(n2218), .A3(n2217), .A4(n2216), .Y(n2222)
         );
  HADDX1_RVT U1935 ( .A0(n2220), .B0(n2222), .SO(\intadd_0/B[4] ) );
  AO22X1_RVT U1936 ( .A1(n2306), .A2(\intadd_0/SUM[4] ), .A3(sin[5]), .A4(
        n2304), .Y(n1912) );
  AND2X1_RVT U1937 ( .A1(n2222), .A2(n2221), .Y(n2231) );
  OR2X1_RVT U1938 ( .A1(n2278), .A2(n2231), .Y(n2230) );
  AO22X1_RVT U1939 ( .A1(n2233), .A2(cos[13]), .A3(n2234), .A4(cos[14]), .Y(
        n2229) );
  AO22X1_RVT U1940 ( .A1(n2254), .A2(cos[9]), .A3(n2235), .A4(cos[10]), .Y(
        n2228) );
  AO22X1_RVT U1941 ( .A1(n2289), .A2(cos[8]), .A3(n2294), .A4(cos[7]), .Y(
        n2227) );
  OA22X1_RVT U1942 ( .A1(n2270), .A2(n2329), .A3(n2223), .A4(n2311), .Y(n2225)
         );
  OA22X1_RVT U1943 ( .A1(n1935), .A2(n2354), .A3(n2253), .A4(n2325), .Y(n2224)
         );
  NAND2X0_RVT U1944 ( .A1(n2225), .A2(n2224), .Y(n2226) );
  NOR4X1_RVT U1945 ( .A1(n2229), .A2(n2228), .A3(n2227), .A4(n2226), .Y(n2232)
         );
  HADDX1_RVT U1946 ( .A0(n2230), .B0(n2232), .SO(\intadd_0/B[5] ) );
  AO22X1_RVT U1947 ( .A1(n2295), .A2(\intadd_0/SUM[5] ), .A3(sin[6]), .A4(
        n2304), .Y(n1911) );
  AND2X1_RVT U1948 ( .A1(n2232), .A2(n2231), .Y(n2244) );
  OR2X1_RVT U1949 ( .A1(n2278), .A2(n2244), .Y(n2242) );
  AO22X1_RVT U1950 ( .A1(n2296), .A2(cos[7]), .A3(n2233), .A4(cos[14]), .Y(
        n2241) );
  AO22X1_RVT U1951 ( .A1(n2254), .A2(cos[10]), .A3(cos[15]), .A4(n2234), .Y(
        n2240) );
  AO22X1_RVT U1952 ( .A1(n2289), .A2(cos[9]), .A3(n2235), .A4(cos[11]), .Y(
        n2239) );
  AO22X1_RVT U1953 ( .A1(n2294), .A2(cos[8]), .A3(n2236), .A4(cos[13]), .Y(
        n2237) );
  AO21X1_RVT U1954 ( .A1(n1934), .A2(cos[12]), .A3(n2237), .Y(n2238) );
  NOR4X1_RVT U1955 ( .A1(n2241), .A2(n2240), .A3(n2239), .A4(n2238), .Y(n2243)
         );
  HADDX1_RVT U1956 ( .A0(n2242), .B0(n2243), .SO(\intadd_0/B[6] ) );
  AO22X1_RVT U1957 ( .A1(n2295), .A2(\intadd_0/SUM[6] ), .A3(sin[7]), .A4(
        n2304), .Y(n1910) );
  AND2X1_RVT U1958 ( .A1(n2244), .A2(n2243), .Y(n2251) );
  OR2X1_RVT U1959 ( .A1(n2278), .A2(n2251), .Y(n2250) );
  OA22X1_RVT U1960 ( .A1(n1935), .A2(n2310), .A3(n2270), .A4(n2327), .Y(n2249)
         );
  OA22X1_RVT U1961 ( .A1(n2283), .A2(n2321), .A3(n2253), .A4(n2341), .Y(n2248)
         );
  OA22X1_RVT U1962 ( .A1(n2280), .A2(n2316), .A3(n2279), .A4(n2354), .Y(n2247)
         );
  OA22X1_RVT U1963 ( .A1(n2269), .A2(n2325), .A3(n2311), .A4(n2245), .Y(n2246)
         );
  AND4X1_RVT U1964 ( .A1(n2249), .A2(n2248), .A3(n2247), .A4(n2246), .Y(n2252)
         );
  HADDX1_RVT U1965 ( .A0(n2250), .B0(n2252), .SO(\intadd_0/B[7] ) );
  AO22X1_RVT U1966 ( .A1(n2295), .A2(\intadd_0/SUM[7] ), .A3(sin[8]), .A4(
        n2304), .Y(n1909) );
  AND2X1_RVT U1967 ( .A1(n2252), .A2(n2251), .Y(n2261) );
  OR2X1_RVT U1968 ( .A1(n2278), .A2(n2261), .Y(n2259) );
  OA22X1_RVT U1969 ( .A1(n2270), .A2(n2321), .A3(n2311), .A4(n2253), .Y(n2258)
         );
  OA22X1_RVT U1970 ( .A1(n2262), .A2(n2341), .A3(n2283), .A4(n2316), .Y(n2257)
         );
  OA22X1_RVT U1971 ( .A1(n2280), .A2(n2354), .A3(n2269), .A4(n2310), .Y(n2256)
         );
  NAND2X0_RVT U1972 ( .A1(n2254), .A2(cos[12]), .Y(n2255) );
  AND4X1_RVT U1973 ( .A1(n2258), .A2(n2257), .A3(n2256), .A4(n2255), .Y(n2260)
         );
  HADDX1_RVT U1974 ( .A0(n2259), .B0(n2260), .SO(\intadd_0/B[8] ) );
  AO22X1_RVT U1975 ( .A1(n2295), .A2(\intadd_0/SUM[8] ), .A3(sin[9]), .A4(
        n2304), .Y(n1908) );
  AND2X1_RVT U1976 ( .A1(n2261), .A2(n2260), .Y(n2267) );
  OR2X1_RVT U1977 ( .A1(n2278), .A2(n2267), .Y(n2266) );
  OA22X1_RVT U1978 ( .A1(n2262), .A2(n2311), .A3(n2270), .A4(n2316), .Y(n2265)
         );
  OA22X1_RVT U1979 ( .A1(n2280), .A2(n2325), .A3(n2283), .A4(n2354), .Y(n2264)
         );
  OA22X1_RVT U1980 ( .A1(n2279), .A2(n2310), .A3(n2269), .A4(n2341), .Y(n2263)
         );
  AND3X1_RVT U1981 ( .A1(n2265), .A2(n2264), .A3(n2263), .Y(n2268) );
  HADDX1_RVT U1982 ( .A0(n2266), .B0(n2268), .SO(\intadd_0/B[9] ) );
  AO22X1_RVT U1983 ( .A1(n2295), .A2(\intadd_0/SUM[9] ), .A3(sin[10]), .A4(
        n2304), .Y(n1907) );
  AND2X1_RVT U1984 ( .A1(n2268), .A2(n2267), .Y(n2277) );
  OR2X1_RVT U1985 ( .A1(n2278), .A2(n2277), .Y(n2275) );
  OA22X1_RVT U1986 ( .A1(n2279), .A2(n2341), .A3(n2269), .A4(n2311), .Y(n2272)
         );
  OA22X1_RVT U1987 ( .A1(n2270), .A2(n2354), .A3(n2280), .A4(n2310), .Y(n2271)
         );
  AND2X1_RVT U1988 ( .A1(n2272), .A2(n2271), .Y(n2274) );
  OR2X1_RVT U1989 ( .A1(n2325), .A2(n2283), .Y(n2273) );
  AND2X1_RVT U1990 ( .A1(n2274), .A2(n2273), .Y(n2276) );
  HADDX1_RVT U1991 ( .A0(n2275), .B0(n2276), .SO(\intadd_0/B[10] ) );
  AO22X1_RVT U1992 ( .A1(n2295), .A2(\intadd_0/SUM[10] ), .A3(sin[11]), .A4(
        n2304), .Y(n1906) );
  AND2X1_RVT U1993 ( .A1(n2277), .A2(n2276), .Y(n2287) );
  OR2X1_RVT U1994 ( .A1(n2278), .A2(n2287), .Y(n2286) );
  NAND2X0_RVT U1995 ( .A1(n2296), .A2(cos[12]), .Y(n2282) );
  OA22X1_RVT U1996 ( .A1(n2280), .A2(n2341), .A3(n2279), .A4(n2311), .Y(n2281)
         );
  AND2X1_RVT U1997 ( .A1(n2282), .A2(n2281), .Y(n2285) );
  OR2X1_RVT U1998 ( .A1(n2283), .A2(n2310), .Y(n2284) );
  AND2X1_RVT U1999 ( .A1(n2285), .A2(n2284), .Y(n2288) );
  HADDX1_RVT U2000 ( .A0(n2286), .B0(n2288), .SO(\intadd_0/B[11] ) );
  AO22X1_RVT U2001 ( .A1(n2295), .A2(\intadd_0/SUM[11] ), .A3(sin[12]), .A4(
        n2304), .Y(n1905) );
  NAND2X0_RVT U2002 ( .A1(n2288), .A2(n2287), .Y(n2292) );
  AND2X1_RVT U2003 ( .A1(n2292), .A2(n2301), .Y(n2290) );
  AO222X1_RVT U2004 ( .A1(n2296), .A2(cos[13]), .A3(cos[15]), .A4(n2289), .A5(
        cos[14]), .A6(n2294), .Y(n2293) );
  HADDX1_RVT U2005 ( .A0(n2290), .B0(n2293), .SO(\intadd_0/B[12] ) );
  AO22X1_RVT U2006 ( .A1(n2295), .A2(\intadd_0/SUM[12] ), .A3(sin[13]), .A4(
        n2304), .Y(n1904) );
  OA21X1_RVT U2007 ( .A1(n2293), .A2(n2292), .A3(n2291), .Y(n2299) );
  AO22X1_RVT U2008 ( .A1(n2296), .A2(cos[14]), .A3(cos[15]), .A4(n2294), .Y(
        n2300) );
  HADDX1_RVT U2009 ( .A0(n2299), .B0(n2300), .SO(\intadd_0/B[13] ) );
  AO22X1_RVT U2010 ( .A1(n2295), .A2(\intadd_0/SUM[13] ), .A3(sin[14]), .A4(
        n2304), .Y(n1903) );
  NAND2X0_RVT U2011 ( .A1(cos[15]), .A2(n2296), .Y(n2297) );
  XOR2X1_RVT U2012 ( .A1(n2309), .A2(n2297), .Y(n2298) );
  XOR2X1_RVT U2013 ( .A1(\intadd_0/n2 ), .A2(n2298), .Y(n2303) );
  AO21X1_RVT U2014 ( .A1(n2301), .A2(n2300), .A3(n2299), .Y(n2302) );
  HADDX1_RVT U2015 ( .A0(n2303), .B0(n2302), .SO(n2305) );
  AO22X1_RVT U2016 ( .A1(n2306), .A2(n2305), .A3(sin[15]), .A4(n2304), .Y(
        n1902) );
  AO22X1_RVT U2017 ( .A1(start), .A2(angle[15]), .A3(n2307), .A4(
        sampled_angle[15]), .Y(n1901) );
  AO22X1_RVT U2018 ( .A1(start), .A2(angle[14]), .A3(n2307), .A4(
        sampled_angle[14]), .Y(n1900) );
  AO22X1_RVT U2019 ( .A1(start), .A2(angle[13]), .A3(n2307), .A4(
        sampled_angle[13]), .Y(n1899) );
  AO22X1_RVT U2020 ( .A1(start), .A2(angle[12]), .A3(n2307), .A4(
        sampled_angle[12]), .Y(n1898) );
  AO22X1_RVT U2021 ( .A1(start), .A2(angle[11]), .A3(n2307), .A4(
        sampled_angle[11]), .Y(n1897) );
  AO22X1_RVT U2022 ( .A1(start), .A2(angle[10]), .A3(n2307), .A4(
        sampled_angle[10]), .Y(n1896) );
  AO22X1_RVT U2023 ( .A1(start), .A2(angle[9]), .A3(n2307), .A4(
        sampled_angle[9]), .Y(n1895) );
  AO22X1_RVT U2024 ( .A1(start), .A2(angle[8]), .A3(n2307), .A4(
        sampled_angle[8]), .Y(n1894) );
  AO22X1_RVT U2025 ( .A1(start), .A2(angle[7]), .A3(n2307), .A4(
        sampled_angle[7]), .Y(n1893) );
  AO22X1_RVT U2026 ( .A1(start), .A2(angle[6]), .A3(n2307), .A4(
        sampled_angle[6]), .Y(n1892) );
  AO22X1_RVT U2027 ( .A1(start), .A2(angle[5]), .A3(n2307), .A4(
        sampled_angle[5]), .Y(n1891) );
  AO22X1_RVT U2028 ( .A1(start), .A2(angle[4]), .A3(n2307), .A4(
        sampled_angle[4]), .Y(n1890) );
  AO22X1_RVT U2029 ( .A1(start), .A2(angle[3]), .A3(n2307), .A4(
        sampled_angle[3]), .Y(n1889) );
  AO22X1_RVT U2030 ( .A1(start), .A2(angle[2]), .A3(n2307), .A4(
        sampled_angle[2]), .Y(n1888) );
  AO22X1_RVT U2031 ( .A1(start), .A2(angle[1]), .A3(n2307), .A4(
        sampled_angle[1]), .Y(n1887) );
  AO22X1_RVT U2032 ( .A1(start), .A2(angle[0]), .A3(n2307), .A4(
        sampled_angle[0]), .Y(n1886) );
endmodule

