#!/bin/bash
#
# This file encrypted at Sun Dec 29 18:15:33 WIB 2024 by
# +------------------------------------------------------+
# | Author: Rerechan02                                   |
# | Reguon: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/fn_project / Admin  @Rerechan02 |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/Rerechan02
# Sponsor this project:
# -  https://t.me/fn_project/245
# -  https://prof.rerechan02.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | 1f:KD:DU:Zq:WN:wR:Qw:nt:TT:Uh:Ud:pd:82:Cr:m1:dV:8B:Zd:aO:EQ:Op:Bx:VW:LQ:Ru:iH:Ad:vI:uG:hA:Zd:Jj:uO:vM:Ds:Jc:lN:MD:xc:vx:nv:HE:WT:8U:eN:8B:ev:52:Hm:Co:oF:FS:F9:dB:p8:p2:x7:JR:aN:Z1:bU:iC:jD:xY:dq:oM:qp:H3:xp:Fh:yL:va:Ba:VP:QT:Lk:JO:Hd:xv:F4:P1:cl:6G:PI:LZ:vV:Et:QJ:sZ:eG:bO:TQ:UC:qx:7I:um:kn:u2:Ql:4c:m6:3L:mX:L2:tx:AN:K4:th:sa:KR:Yu:Mq:dv:zg:3i:BI:H2:XW:Em:7g:fb:At:u3:EW:fd:5i:at:1q:gF:zx:kb:ek:6g:tp:pj:aL:cP:cW:GV:PX:dd:ap:hm:QX:q9:SV:wX:67:JI:cO:yr:2U:0b:7Y:fh:hc:rE:Gw:88:OS:Ey:4a:cu:GW:jp:TN:V0:l0:uf:6c:DG:Pq:qa:s6:5G:Sc:Vs:jW:e7:eg:J2:nN:Ch:FL:CP:T2:64:dV:lW:xZ:LP:PM:yL:M5:zk:yI:QL:bp:lB:EE:nE:8Z:N3:p6:Tq:Be:r6:wr:Jq:7W:HQ:Iw:0a:NQ:SV:wm:0U:pP:fS:YP:IV:F3:7U:WQ:Jt:US:qQ:S9:nQ:Qq:fw:rk:MV:Dq:C1:PB:JZ:TZ:PQ:8n:N2:LV:X7:BZ:nw:7r:7H:Tu:mc:6C:4J:84:rM:r1:MY:D1:Be:XO:k3:BV:Oi:MU:R3:6S:wG:G7:uP:Dg:wt:HA:Nk:eF:lq:zZ:2B:4F:D5:4H:nC:Hb:N2:S8:DE:Se:d4:ZM:sz:Lo:qG:Dl:oG:vJ:cJ:aC:7Y:oS:Gf:8x:Z2:Mz:SI:Ju:al:iK:0T:By:DG:L8:go:02:Pg:LO:QR:Sx:nQ:Re:cv:F8:yU:0B:kg:ww:za:85:jL:mH:EJ:ZA:9c:KC:lo:B1:zJ:6Q:ZX:2v:oA:B4:pX:iz:9c:mq:w7:P9:FQ:S4:NK:io:GP:zi:i9:O9:w2:lw:aL:U5:MN:hE:A0:UV:mn:Qu:Dp:pe:e2:U7:Eb:4c:SO:Ks:8n:cg:Dr:FO:CK:pQ:p0:Jr:gw:BT:H0:z2:wM:E5:TG:6Y:a1:IP:ix:60:XK:9P:E0:0d:Wh:HE:qu:U7:1s:an:CG:lL:tw:85:MU:D0:7Z:9f:HG:AR:NY:ji:yc:9P:ZV:t9:TN:eH:HQ:ng:kq:8C:cp:nj:Q1:mq:q3:i4:xQ:oW:f6:bK:O4:Mq:Ne:Q9:rC:mI:XI:BA:xh:jT:Xk:wp:b1:BB:m2:9t:3v:fU:eD:3L:l0:RR:ys:Zj:ak:Ij:hq:Eu:77:Oh:K7:tM:Bd:iW:Bz:E9:2b:Qv:Yo:xR:aS:4T:jP:MV:HO:fs:lf:lQ:08:kG:Ju:ZX:7i:gK:HY:Q7:Dv:AW:Nr:ft:hb:h5:gq:Tj:4R:qH:7s:5P:wX:X3:kv:hz:Cv:xs:iO:a6:Ey:Az:1Z:tG:hD:bN:0d:dQ:3S:38:NP:nd:le:sv:zL:DQ:8p:zX:pa:Ud:HV:fS:zr:Ol:1v:zR:m0:u3:kN:YP:yE:YI:Zi:UO:hY:Ra:8V:Cx:U4:SQ:N9:Ae:SN:K6:Dk:Cr:62:YQ:gc:Nn:oR:XF:Hm:2g:vL:Fi:hh:3b:gM:du:ky:Tb:Wt:7n:7S:eP:3A:Ti:We:SL:d9:za:Uv:wn:ne:gr:pk:7y:pV:bU:V7:sI:Yk:Yb:8U:oq:bl:EB:kL:yM:Gf:1Q:NT:d2:mq:WD:tf:q2:y0:wj:Zg:vA:M4:lC:mn:4R:NZ:xO:TC:X3:yP:uF:aE:aJ:1o:Ey:fH:rW:uR:L7:Px:wa:Nj:Fs:hT:VG:HZ:XG:Me:Qq:0s:ix:cc:yq:vA:tN:wk:aH:0Q:0F:K2:WY:fH:TE:DH:Ck:iJ:To:Cs:Ug:bX:w8:0v:vR:SD:Fi:NW:Tc:Yq:k9:Wr:vP:Mq:o2:D2:bL:pp:d5:4C:pG:Dv:pQ:nc:sO:9f:NG:pd:bT:Nw:H9:C0:yc:HM:VD:o0:WB:i7:a3:kt:kO:Oq:68:bt:hv:UC:sk:PX:q0:mp:MA:Ks:va:F0:Z5:ZC:ba:0c:Gk:07:w5:9t:YF:90:lb:62:N6:68:U6:as:tY:XB:Vz:WK:ro:uQ:YI:ZR:mK:Et:4P:IL:F3:91:uQ:Ym:9S:Ea:7H:Z2:BK:Zk:66:FL:xz:U5:bz:gl:69:Sk:Qb:qf:7y:p0:Ji:IF:SK:fZ:tP:Zo:Ul:Wt:cE:Mw:Dq:pz:OI:R5:ph:wT:pj:z1:Z4:v0:BQ:w7:Ly:7n:RO:ht:SM:tJ:oO:Ta:my:CV:Ru:qM:lU:XN:2p:EA:EJ:9k:EB:tr:2V:Uz:Ad:C9:vz:Gy:MD:aa:M6:Nh:nt:yQ:vi:sB:MO:ts:2D:oy:ol:EK:9k:Qh:Ym:Xc:Iq:q6:Gj:r0:EM:bc:ZZ:LL:kz:6c:aG:cI:Gs:Q8:5t:9d:2s:Y8:NT:UI:Wb:M5:wP:yz:p6:w3:6w:TU:mA:ws:6i:oY:eU:M9:Lj:sK:zq:gb:cX:Ws:ab:9W:Ek:vp:uZ:54:pp:7f:yq:yR:fI:VN:8r:L8:ii:1a:DH:rv:0A:GQ:m1:bC:1L:5h:T0:2g:5s:F0:WJ:t9:yG:kf:Du:q5:pp:hp:qJ:4r:up:AF:VP:yj:9e:RP:37:0V:vF:sT:Tb:7z:fL:0Q:EY:OO:Bf:EO:GH:wQ:jy:K0:dV:cZ:2j:0e:5v:kc:w2:Rq:hV:G6:Qx:q6:Hg:EP:nf:p4:S2:zG:tS:8S:Hd:9B:CU:Ic:MQ:Nh:i7:kW:lk:VZ:SJ:0D:yo:ym:wI:QW:4T:aP:8t:Fy:s8:QS:dJ:dE:V7:rO:xK:KK:gq:RR:fA:Sw:Wa:Vt:YA:Hx:Tf:M4:mK:gj:q4:Q1:9r:Bj:0Y:Xf:jP:OW:hc:vP:EG:gn:Gu:zr:1G:lY:rh:B9:uL:JJ:iY:TB:Sf:bk:SS:Hx:d3:gg:y9:6j:0I:JR:QV:21:NB:8W:Il:Vz:c7:wQ:61:3c:ja:dl:ui:vI:Ey:LI:46:PD:aO:ZN:IP:cH:5v:nk:sf:Rn:XW:Yd:x5:xe:Gh:TY:gY:kY:ga:0d:xf:o4:ll:XG:ZS:qD:Ma:ha:Zc:zH:SM:Ji:N6:Ib:q4:UF:9N:Uw:KZ:96:Ww:o7:yJ:Km:lX:fk:BX:LF:ZJ:fL:tu:os:vr:D3:7C:YN:AW:6l:lh:Nc:7A:uq:GT:tV:5r:LC:VT:xu:GS:ZS:PP:MD:eT:dl:3G:Sh:dQ:Bb:jj:02:F8:EZ:ZR:u5:jT:fp:6H:6l:G9:Ez:d7:tm:M8:fc:mP:zK:aV:PB:IV:T9:oO:DU:yw:6P:Ku:X5:8Z:b0:bl:8z:dH:8D:PS:xf:Qf:oU:UF:ER:eX:Z7:o7:7N:2R:6U:Dz:4U:7U:aN:gt:EZ:BD:oy:h6:eQ:By:dX:cr:Pi:iX:ki:V2:TZ:Qy:bJ:Iz:eG:ms:p8:XF:Wj:fQ:zK:Yp:PK:9P:ZS:0N:on:9k:Km:W6:Rt:WM:yS:ti:XR:o4:OE:at:7v:dS:Ih:in:sY:cd:i9:iq:cv:k7:YO:tm:Nr:br:fS:Nj:md:iC:fG:TE:0Q:lT:vf:rM:BT:1p:dg:6g:1r:AV:CX:Ag:Hl:MH:iK:RZ:Ep:jr:1i:IL:tT:mg:Rr:bd:xR:kF:9R:fy:qX:jM:ja:sl:Ex:14:cz:Fv:rR:tE:H0:ae:qR:Ee:ob:0G:QV:FQ:3Q:HX:w2:7H:RI:Vs:E5:QO:xc:Nx:GK:ND:BC:rM:Ed:oY:sm:EL:5n:6Z:Fd:JE:7M:q5:Qh:4a:So:3M:EQ:nC:Jm:1T:vb:v5:yS:29:7x:nM:Vr:wY:UH:GN:4S:4F:4c:fm:3f:Cm:Ta:3U:EQ:nb:nu:TR:g4:vn:n7:0y:md:e5:R5:H0:Su:BP:aG:Ku:LU:HZ:JK:P5:yb:g6:Z6:id:6c:Rl:3A:AV:Sw:8q:nj:XP:SI:gx:xr:7U:EK:sb:oW:C8:Sf:Ch:KF:sc:jH:17:ug:iV:uO:Ya:bR:yQ:ik:E8:Va:dU:Tc:fq:qT:eo:1K:Ge:7x:Ou:sO:ty:PW:xz:S4:o3:Fe:Yk:L8:lW:pv:3P:TT:68:H2:lY:Gc:JZ:up:Nn:ru:uf:eI:a4:Wp:ea:to:po:F6:yu:Fk:ry:d0:D8:5L:L8:rt:tN:kR:YF:W8:Ih:8v:r6:5V:hP:xY:my:Z1:gh:65:sR:QO:Dp:9Q:dk:Hv:CQ:Cp:Ky:eX:xy:bb:2p:k7:6M:fK:cf:9X:sk:Ta:u7:CF:Xg:x1:NS:Mm:6Q:gl:t7:4T:j2:3A:Yt:4R:Ig:ui:sS:Zg:S2:X0:RP:ll:b1:U0:vB:FC:X7:FS:8b:XU:Zn:u3:gS:sh:Gp:Z1:Zh:Z3:O6:9A:0a:fW:eh:gV:64:js:lg:8L:gI:GO:Z3:pt:wl:Ss:Pr:cq:xW:GE:ny:eT:Mw:qG:Ho:qH:je:Cp:iw:0D:VP:dj:7e:Vz:1J:6X:xn:SO:6c:oC:4m:va:fu:rd:5x:2T:OM:DE:IP:at:i4:TH:uX:7A:wT:hk:kg:YU:Aq:yk:W4:20:v9:Cg:LU:J0:9E:UT:H0:sM:C9:1h:hL:IT:os:3F:cT:Se:zU:55:oG:Ma:lK:R3:AL:v3:hh:42:aD:mZ:Vu:aY:Eb:NV:3N:Np:sB:q0:zH:Bz:Tl:Ev:gt:eS:Zr:si:or:dA:mR:P7:Gv:cR:iG:tp:Y0:1b:jH:Uk:aq:fi:Un:uc:Xj:2D:Tl:Ft:uq:QX:5r:Kv:as:Es:b5:gZ:YL:6j:1N:B3:MF:ej:Af:k9:ro:TO:fv:ZX:uw:Tw:D3:4m:z0:qk:xd:Y0:oW:Dk:Fn:ut:uC:6Z:OA:np:hI:pi:NF:ai:CH:qQ:s1:uA:ko:fo:F0:oz:7U:eb:k4:Rx:QT:GU:wY:UY:Ax:hc:1L:32:ZA:LG:aT:0M:iO:z4:kc:QY:aw:ZH:1A:1k:NP:Ny:0D:t3:KG:rs:XZ:Gh:Vm:ty:lu:1l:nV:Y6:eW:q5:f0:Is:aK:P3:1R:Do:Bp:93:tF:M1:qi:Dn:II:1L:v7:hA:Jz:YM:Uy:YW:E2:Cn:mk:ej:q3:pw:oU:0e:PR:bx:ku:xo:vt:EO:eq:i5:kZ:lg:Hx:wW:9w:UX:ss:7n:5V:Z2:M6:Oi:lY:zT:Lh:o9:ul:47:3N:S7:iO:TS:NC:hf:lJ:lu:J2:6J:uP:lr:Y6:Qr:NK:zv:kS:Wy:U2:O8:Ly:SJ:qQ:0Y:N0:S0:Mu:uc:rs:WD:jL:tH:4S:e6:23:gC:5Q:b5:WC:rM:Dz:4l:Wn:4P:3K:Q8:OU:ju:K6:7h:QI:M6:9p:Iz:K6:Jn:vJ:Ar:DK:U3:0N:JU:H1:EQ:6Y:lA:JU:bi:AG:YL:xf:WV:CC:J0:1Q:j0:Nk:Nq:gE:ZI:lB:TT:3y:B6:ZL:lD:Mz:sy:HZ:Do:48:5F:br:MM:h9:Hm:pB:u0:Bw:Jw:UU:c2:VD:oP:YQ:9r:QO:QF:OL:vp:N0:Ke:g2:4v:zi:Fy:ME:4p:7e:uK:oy:zm:9w:1P:Ha:qH:cD:GJ:OV:HC:AJ:I1:QC:r0:S5:PY:bI:GT:oQ:dO:bs:Io:sI:fm:ob:84:gm:pK:3U:lV:15:hU:LF:Eu:cK:Ao:cY:T4:9k:Jh:tW:bz:KF:FN:Oq:6T:BZ:eQ:cK:nj:0U:c8:oE:dJ:J2:ec:F2:xd:Yx:Yt:0C:jw:CC:lU:mR:wx:AB:vx:Gq:kv:aA:4i:dc:S9:BS:YT:Zd:MG:ra:lH:cz:AW:7m:3J:Zl:Nb:4f:Uq:Og:Vg:0G:nQ:rl:2r:15:QU:Tv:M6:aB:Th:lX:Y7:G0:xE:hE:Tv:X6:S9:KS:OC:Cs:Im:7W:X4:mW:vH:tC:J1:YJ:GB:FV:Od:Ap:hv:Ln:Dq:72:wv:CC:0f:oZ:aD:N1:ZZ:mO:Dw:XB:D0:ut:3y:xR:7O:43:ER:Xd:1p:EZ:Z9:TR:dK:eE:Yd:Ci:mL:gR:Ut:Cw:Q5:WM:tG:Z4:B5:ot:9F:cY:2Z:1r:dk:rk:wb:5K:6k:aF:4f:9W:S6:ev:Tw:Uu:Tw:5J:6k:2k:oI:jQ:wQ:pr:XE:z7:ZB:dQ:0Y:GB:6v:Qx:hf:ZN:E9:xX:GP:tt:Km:ZU:4x:ii:H5:BF:Oi:7o:Zj:Sy:cp:7x:Ta:oA:rZ:Fa:U3:NW:K6:sz:Pr:nb:Qb:nf:iD:E5:Xk:zh:94:a3:xV:Xn:xn:LD:oA:Qh:sr:RQ:PE:6L:mk:WF:pK:Oy:2I:pH:6y:9q:jB:rz:3U:9m:2q:wp:aU:pm:hr:Tj:jr:UI:fa:ZN:fk:xY:Ni:Bt:zH:XC:cZ:bZ:JW:da:Kh:C8:T2:uK:QC:3g:fi:3e:LT:9Z:C3:g0:NH:Lw:OG:Cv:VJ:A3:M2:cU:yk:6a:Ta:ir:pV:Ls:nw:ww:5K:Xt:Gn:Q5:ZH:2I:TV:K0:1m:QU:9b:CD:xM:Xx:Ks:WT:MS:Td:s2:0M:T5:g4:xZ:Hn:Hv:SF:3E:kx:FH:XQ:J6:6z:za:Dv:fM:g9:5H:wT:K6:dg:4P:jx:qz:A9:Tb:mK:2t:3w:q3:WS:1I:u9:GG:LO:EO:66:gC:AL:vk:AV:Ef:i4:rQ:Mh:Ld:La:VZ:7E:p6:F9:As:Ue:kR:e4:Ak:Z7:Q1:3A:2i:rt:gC:RE:Tk:dr:wb:TJ:dL:j0:EV:cA:nt:w2:mL:WW:rC:Nm:HV:UH:6E:BN:s3:9s:et:L4:my:lm:r4:9N:55:oU:f1:ex:kJ:qG:2W:l9:di:b5:M9:ra:3z:AD:tm:D1:Iu:fG:YA:gY:KD:xx:0r:k9:GX:46:vH:fA:Ov:0S:gP:48:wR:sU:ku:cU:gn:HX:rM:OV:BB:jU:sx:eM:tz:oo:sO:74:9v:hF:Ak:LT:WL:Ia:2W:Ln:gQ:F1:u8:RQ:vZ:wW:1Y:zo:XN:nz:RH:t5:Bp:AH:VT:DG:Os:bf:QC:1R:uh:k9:98:Jm:n7:L3:OA:fL:U8:Ex:ci:o4:DN:dx:hx:f8:HA:yM:hL:3a:4I:mH:7P:4Y:nq:bJ:C9:LE:Me:aQ:ci:un:hc:Mu:Ex:A6:dQ:yA:DS:zB:eP:h7:4m:VV:6J:HO:DF:mD:LQ:Ja:KO:fF:fN:ep:4U:ki:vf:Ts:fp:a5:O0:nr:rp:05:fB:Dy:vO:x8:IZ:Wv:tQ:iB:ve:OY:A9:ys:oJ:Qn:UU:8p:MV:VX:SO:bA:Cb:5W:4V:8Z:9m:We:GU:U8:zt:NJ:WE:rE:DH:PV:ei:Ae:tP:Kh:NS:VV:42:jR:Vo:ci:wL:Vc:CG:nk:90:p9:ZJ:nP:oZ:kz:Fx:hK:32:cj:mO:gy:qk:Nd:TC:jo:OA:Zv:8j:29:5g:0E:VW:Kr:yf:qs:zL:1j:Zk:N0:uH:io:FX:d1:AQ:Wc:q7:sq:Wm:Sw:1I:x8:Kk:pI:5d:dt:i4:XF:yn:NZ:MC:w6:YF:n2:T1:SJ:4q:ez:r6:uI:6C:44:Sb:AN:Y6:6A:UB:FK:V6:nh:qH:Hc:K0:9M:wE:iU:uq:YC:b0:0u:VP:BM:fL:S0:gC:ce:9q:Ur:Ly:hV:bG:3B:C5:pv:hF:H1:K8:eG:qi:v3:Io:lK:qJ:kr:84:5X:9I:H3:hQ:N4:f1:5w:M4:1o:8c:D4:hV:tW:ZP:em:md:Xr:ma:bE:pK:Ek:OZ:Ei:1S:NJ:CR:EI:Ol:Zy:7p:IC:OP:pZ:Nt:P9:ZW:8b:M0:Wl:gz:GJ:ya:ki:P1:Vs:WK:Lp:5l:pz:lr:Sy:OG:J3:3c:jj:em:yr:HC:ui:Pb:bw:qJ:Bi:f9:X4:RP:Sf:xb:Aq:Px:uh:2N:NW:1h:GY:e9:I4:Fy:ki:WM:W6:Tj:16:gC:B2:3L:Th:FR:mt:1L:oS:ch:lB:Gt:JI:u2:dI:cz:5f:EW:3u:FJ:HK:Vq:xI:SS:ix:AV:lJ:fF:1Q:zJ:G3:Uu:2E:lb:4p:rr:Ru:Xu:b8:rA:Jj:ls:91:30:21:sk:7A:8J:qC:j1:Kw:lU:ee:Eo:dY:je:jo:lP:7T:e6:wq:T4:NG:Fd:M2:D1:Fh:iJ:6k:4v:9m:Cl:cn:P1:DJ:Ff:Sm:pa:pc:xM:JC:e5:7D:0R:k4:MW:EK:HZ:TO:UG:Mc:My:CW:Xa:bY:co:Gj:2Q:Fp:pz:6a:QS:j5:Id:bk:5u:mZ:C5:KU:fD:yL:QA:Uh:EO:EM:mq:Ku:uW:9G:Qs:Pw:2U:Wo:mk:4y:Yl:0r:Cw:T5:Rk:cT:MF:GZ:DY:zv:1P:yQ:nA:1c:i8:Z3:g9:ej:nR:Z1:UT:28:kr:Zg:Th:73:pQ:9H:vc:A7:C1:OS:tr:Da:n7:6Z:tZ:uY:Sm:Xa:0h:Ss:Xv:Uu:Br:SP:pb:ru:Wu:LO:Ip:Ci:bb:AK:tA:Xo:NU:c7:fp:YQ:89:hw:D9:t7:od:3L:6f:aY:T6:pF:Z0:k1:zJ:J1:jl:BX:Ub:zE:f0:PQ:Ur:1N:YQ:75:Hl:Hu:0h:Yr:At:vj:Mr:CP:78:XE:6J:16:o3:Ca:ea:iY:mG:9G:eR:Fg:XZ:7H:bd:zm:dL:Ic:W0:2q:qO:Bt:AR:R4:Ze:9d:AZ:tz:ES:z9:ol:pq:EC:QA:hF:gU:j0:WC:Nt:Mj:XO:a7:VX:mD:FD:jq:DD:yZ:Gi:xf:i4:Cb:p6:36:kd:G7:MN:eW:gC:8m:Ne:Eh:HT:pi:ZY:DK:fD:4v:AV:D2:cK:s9:xU:EQ:gt:Ia:Ho:nI:Q4:N2:Qq:ce:nn:Ns:Qb:Lr:SK:0e:JL:Aq:fY:eV:6u:uR:Ya:bl:YS:Zo:Vy:bL:JF:J8:Id:N0:CG:EB:HK:XV:hZ:Sz:cT:Hw:9J:CG:5x:IE:ka:VY:6T:cI:ua:1U:cC:yG:gd:vO:qV:dq:W6:cn:sK:vp:JV:qs:uP:gr:IW:FU:jZ:4U:pB:og:lr:VP:5h:vH:2K:j7:vF:kw:Ki:Q0:wd:W2:p8:L6:Iq:0W:2N:Hl:Qs:r9:KZ:65:ec:eM:NV:YT:MC:oN:Uk:ZJ:9w:W4:vM:uf:za:hb:oj:JX:FZ:OC:nU:4n:jJ:5l:wA:C0:gw:e7:Yn:k7:dL:OX:cC:In:a6:F6:mM:wU:GU:fD:Vw:lD:Dc:Uy:07:D0:Em:EY:w4:PY:xo:O4:4T:BV:Mu:3t:eI:FK:06:xC:QL:Ff:Jc:wn:BG:cX:Hh:VQ:VF:k9:xp:yy:gY:8a:sN:am:Js:wu:df:Yl:KQ:jl:is:n2:yZ:HL:9f:FD:NY:7q:KG:zz:E9:TM:6R:8Q:km:72:gF:C7:Bo:E6:4c:e3:4V:JH:44:Pm:Hs:ts:of:Wz:9l:ZU:3C:v5:Mq:Ca:1g:hf:AX:lj:It:g0:Sx:Dj:k5:T5:Tw:Wd:xO:ah:AX:0T:Dt:eJ:pg:pJ:U5:Kj:kR:Fa:jk:2u:iD:tW:iB:bS:w8:hR:M2:my:Ji:fK:t9:dW:vK:ZX:BC:wT:gO:tV:vx:dU:f1:VU:xZ:Rk:wj:Mo:dn:Sz:4L:1O:PS:ld:jL:Fb:pl:zb:UW:1O:H3:TM:qv:1L:ps:iK:3E:EB:R1:LJ:WY:xw:Ct:AE:us:ze:Bf:D5:Mt:HA:Sy:F0:Z6:bI:Km:2J:ZK:O1:b6:yB:7X:XD:XM:sY:Ve:R0:Q8:pB:dz:f3:dU:Bk:G3:4v:ht:HP:Sn:6B:VP:pG:en:SI:Qj:6H:JO:1f:OF:yC:HZ:ZF:xR:xm:r5:ky:tI:xQ:x1:Ay:wp:94:Sc:5B:yg:aV:eK:VF:46:nE:2I:se:sA:OT:vc:7a:0x:46:LS:NX:MN:TZ:7Y:rQ:1u:lB:xB:9d:a6:1N:Qu:1n:NI:74:MF:3E:gF:cK:C7:LT:XZ:HK:eq:Bc:4J:A9:Ra:yJ:L9:kY:Pu:bN:jH:iD:CW:h3:Mn:FX:MM:fw:j6:zH:xG:kD:27:PG:sr:r0:lg:d1:ZS:hg:gJ:vE:CL:df:Nj:tn:qL:7B:BF:0g:VS:5G:En:Kq:y9:4y:8Y:3Q:6Z:6q:UY:5y:Ls:eA:yk:GU:cK:G2:1p:Cx:Ns:S6:Lc:S1:r7:Ec:ux:a7:qP:dL:km:eI:X4:4A:DB:rV:xn:qu:Lt:nU:lG:WV:HB:gV:yq:L9:un:79:Hq:YP:V3:p4:mo:6H:Zn:14:8v:sA:Ab:VU:Yo:yu:Io:Yz:MK:DR:UJ:kW:mE:o3:0w:ZP:EL:c1:pZ:EX:DZ:Sv:y6:mC:Nt:eM:CH:E1:LN:pG:L6:ii:5P:Yk:Cq:4p:51:tC:zn:GR:EP:vY:Be:l8:TE:9s:yp:C0:QN:hb:n9:DJ:2p:56:Xj:DW:Ta:aQ:KS:I9:cR:BX:Ur:rI:sG:px:82:hS:42:m4:3o:wT:wG:Da:8S:ml:PE:Sx:5v:BN:42:Gg:Sq:Aa:8j:Zz:57:iG:qg:2H:2w:wi:z1:Ml:Pn:Db:57:H8:CV:5Y:OC:hw:Az:we:L9:ol:0j:Ve:q8:DO:MQ:hn:1O:CG:JF:KB:kA:fM:0v:5O:mL:n8:sA:sG:YY:YI:jO:ak:Ek:9k:wC:0q:gZ:hJ:sb:EN:sH:Uu:zG:qZ:ak:kf:tp:Gd:pn:pK:cE:JR:mw:tb:2C:F5:Ws:Oq:dM:QT:Oe:5r:Kd:0H:hv:O5:RA:N4:ae:1u:5o:Zo:XE:oN:Ik:Dy:Wb:UF:x3:WK:of:Ad:t4:xK:GN:g9:46:du:Qd:KF:FY:FB:nF:eB:V6:HL:G5:fB:gt:6O:Sf:uL:GC:3i:UV:rd:b4:9d:1t:n3:iH:Iu:yM:Ts:BS:L0:dB:IZ:dj:Mn:K5:pY:It:qk:WU:bP:oF:8H:ZY:3e:mT:GI:ud:Ho:eS:Gn:5m:Xr:8G:WS:Pv:HT:sw:At:7U:4Q:Z9:Bn:YY:PE:vG:1G:07:jY:dU:sO:Bo:OJ:oP:5x:Im:Vw:bK:yz:px:QN:Ot:D2:oH:sk:qr:uI:Jr:OW:rt:KZ:SS:bZ:ax:BO:eU:pR:HT:CH:j4:Hc:52:Or:Jy:bW:Qh:XL:mq:OL:Gb:RU:Rv:uB:mU:Us:mb:b4:z3:5E:z1:cX:RG:2F:oQ:Il:le:3Y:7P:TP:nb:HX:J2:DP:hg:oU:5k:wA:MB:FC:BV:HS:5e:np:nQ:Kh:Xl:8z:39:4u:Rz:HR:br:WW:u0:Pg:Uw:KJ:sP:58:sk:qN:5B:nD:b1:8P:be:S5:ct:cY:BL:NV:QF:oC:B7:5X:8Y:2j:Zf:rf:iv:dn:0s:dz:gA:Hi:bn:q2:o8:Vx:G8:tn:pp:1V:5D:nY:KO:xo:l9:Mr:qg:b0:kG:8s:XL:fP:Qi:pI:zh:wf:Ea:ql:3Y:6b:VX:RL:Dd:81:tf:Lq:mt:N7:5v:NW:PQ:BC:Lb:2C:Oq:lp:iK:YI:qh:sr:MG:T3:G5:bH:eJ:W7:EX:EV:3w:AR:um:O1:0Q:si:yd:BT:m8:NM:jC:GE:cl:eg:uV:Vu:2j:hi:8D:G9:u4:5M:n8:tD:Pd:IV:O1:PI:Nt:Tq:Lv:de:Vs:0P:bg:hq:v1:Dx:Ye:wP:gx:2n:0v:YG:X2:te:Tg:Te:7T:xa:RO:iB:1C:7M:7m:1y:Re:5d:gC:Z5:KN:pJ:7O:6i:iV:MN:xi:v7:cr:xP:Mm:0V:bn:kg:Rw:bm:GT:3N:Nv:2O:FI:oH:cU:WD:yh:On:VC:xI:i0:zA:jm:rp:mB:84:ld:2Z:A1:y5:ks:3T:gx:pb:7s:6y:SS:2X:dm:3a:NL:Sj:6c:RR:oD:T2:e8:Jm:Z9:Ph:Vz:ho:e6:GF:k8:Zc:b0:ci:fV:tT:ct:KX:CP:dQ:Lc:Oh:nR:Hc:KF:KS:gt:Lk:ph:n6:hA:lp:Af:Vq:XD:AS:2H:nG:lx:Wn:pb:oC:lB:CW:Ld:Xf:yV:aG:uH:Vf:ep:nd:2d:pG:L6:D7:QQ:kO:E4:9a:1k:Jw:Pz:d4:0M:TV:sF:7j:JH:ig:dV:UA:ol:2z:Z7:L4:un:SI:DH:Ad:zR:cU:Ds:yW:eX:nn:dy:7E:ZD:yf:sc:G5:DA:to:9d:x1:3q:Fs:ta:JC:ON:5R:gh:bQ:ei:Tc:LK:Xt:xp:g0:lA:aY:TH:81:if:ks:t6:Xg:Zz:zH:77:By:BW:FT:tB:JH:P1:QP:gZ:lP:aQ:1W:NL:z7:46:kk:Ui:ji:pe:DL:ql:xu:Zw:qf:EI:qc:9B:Rn:xA:qr:Z2:Lr:Bc:nk:tE:Xq:tn:ej:nn:Jd:Rv:SP:DB:kr:po:ec:L9:AY:Yj:w9:rW:MH:GM:T5:WF:O8:mR:C3:Fu:k3:Ns:KB:qs:i0:8e:ZZ:Pn:7f:kL:ES:4e:9K:5a:pV:Zm:Bh:KV:1q:4Z:tp:YH:2D:sp:ME:wX:rp:5h:AL:uc:1T:22:wv:n0:QY:1O:I2:ec:18:0B:rC:Q1:A9:FU:GL:xn:rf:yd:nt:cA:rS:GN:VP:6K:9A:LC:aL:NC:cP:eX:Jx:fd:Jr:hw:Nu:qS:d6:2o:ac:lE:bo:lO:oJ:mm:b1:87:Cr:BY:yK:D5:kS:gZ:jv:bD:ww:Te:xF:LD:Dg:0i:Ou:ju:pC:lQ:RR:yc:LK:KH:xY:qV:F9:C9:Nz:MP:G3:An:jb:ey:yj:Ze:up:ZA:Pi:hZ:hb:JX:KJ:PI:ux:Is:8d:5l:ld:aM:ae:f6:wC:ih:0y:vZ:jk:bi:ap:vY:hV:Vi:jY:iK:CV:D5:Sv:jD:rM:lw:Gt:S6:Em:WD:zx:dE:s2:9n:tr:Dm:Bw:xX:bs:kq:RW:ZI:XB:yr:Ny:wV:fL:X6:Mp:yB:R4:gM:B5:GR:Qf:dm:X8:bm:w8:ZA:dA:Ve:Zn:jb:71:r2:L5:e6:vF:MA:UR:Ze:9g:At:Kf:P9:OG:4s:6I:8B:LO:Fw:MZ:AP:0b:LF:Vg:aP:X2:7O:F4:e7:bh:mE:FI:7c:Fr:CP:8i:oO:aA:g7:Aj:6J:TT:PX:I6:jk:pW:hX:oh:a2:PB:ED:Kg:6X:Ay:mS:xw:l2:fx:vl:dv:kT:vY:i5:YR:9F:zv:Y0:De:fI:0J:xA:fN:BD:mh:aH:Kb:3X:iI:cj:z3:SB:Co:Yo:fU:1o:xS:Fo:QF:Zt:wr:9G:gF:DM:au:uq:HF:02:hE:1U:JK:lJ:rW:aC:dW:Zd:Cn:qt:gH:J8:AP:a4:hE:nk:l7:Lv:26:21:fi:eC:Wk:Xw:jT:Fz:L9:ce:Dt:3T:FT:HZ:8g:dw:Iw:aH:A3:yT:zE:bg:XB:Mg:Zx:SF:At:RB:Uj:YP:17:s9:83:qP:tr:rz:T4:qD:2X:2A:74:n3:Nq:Nl:lc:Ii:oA:u8:NW:1U:dy:RS:05:UZ:8D:iY:Gs:rm:oa:e2:n6:8M:lT:94:x3:wo:co:LR:8w:SJ:Wk:Vh:mc:cs:H0:6S:1g:Ue:4D:tU:cH:KZ:Kz:Bh:nE:k0:SZ:A7:UF:9I:7Z:tn:Mp:IM:tJ:ih:8q:5F:Ix:hV:fV:F7:mP:g3:kv:hV:GK:xF:aI:7B:X2:qz:vh:WU:jM:kS:hn:jj:Eu:WL:pn:SC:C6:SL:vA:ed:u6:bH:S1:Nb:YX:7T:S2:ON:Yo:rp: | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�
vw���G����E
gU�y�H��4�8[ߑo��=%y�ٌ^y�����6L�`=o������\)�<Q\;mo�ϢLc��[Kz�F��o#��g�F��9�"6r�\j�$|gȜ �b�WjM�z���+��_��3�~5�a36����z�v��"�n�UV��ku��&7י��M����\-�Yc﬊��8�AI�/f��� �ﳬ6�(�PC���u=g��U�eG�O��b c�7K����Xs�o	�-�n� |X3
���\uhg���>cyPTi��Y������V�XQw�g������~�C�?��g��X|FU����
`��uD��g=���f(�b�u�KF�
�ɉx����\�5)2~/�e�5�� ��ӊO��ǫ�@�N�1{�����/���$�Z�{	�-"f�|Dܑl�"�2|7���_l0�s8����U�OB�lq���l������'�К��L@`�fM��G���v��������m
��������f���4�a�'���\���d���b�7�Mοd~�-~p�W{2JA&�Ӏ�H!��|�@9H:gPY��&�U����x�`��
� 9��E$�"v��=���C�JQ�D��B��&L~��7L��n����=pz_>9�\)�\��A�1fǗA�>ż���kHl��H��ы�\�C�*�ђ�1#ȟm�yj9��}��G̞��
��:36�c��t��')��� [:��2����G�@	G�>7������Gh��뢪�w�gs��G�K�`��B4�|�f��?ZUG�BT
�t]ad�����x�~��[�#s�+�d��M]���p^6[�л�	�@�nC80�{{L�D)E�RF��&�yU��j�G6�G�v���w#r� wqfL�W��H���t�3��HͨЯ��^����i���A�׍�z7R�ms�t����g� �Qa��v�"���J� o��� m���1�^[�;����Ģ��}&�-�p��s%5?��`6���Z��d��
�H�{�7���߰�˷i�8�BA�쯢}�~��QE ��R+���&o��e��O�>����]�Ww����w�3M_��$v��X�۸�9r��x���t�2ǥ�M���%�$�ܗ8<�"�2���
�����?f�}�P��|���! ���gd�S�J>�kL�*����Y���Db`فCi�৴�jf	 /�1r�9HAd�������#4��/c��k�VW{���Z6�
L���Tl ���.��EU�?T�]����	��CJ�ƚ�
��~Or����2���h�35g��ۜ'3-��Y�_�A}����[m�	S|4og�H���-�x�k��#n�{���O�݋.��{e-�
a�� Yw�z���M�׽�	�GV�V�¤:Q��Bg���q�Y�����q�^#Gh#�D6B���d��t0M�=^���� �h<�[> ��0�Y��&�pRt�^-Dl���{m<e0V�9Q!N\EHo��s퐊�koݧ
�2f@���j���N#�rE�m��q�F��Lu�[�7EϪ���~��YXiEY���~ӯ�&�B���P��^����QC�c�Du��܁ם�|{���:��؋��m��&�r:̝�Y���v��f�Y[�Z�ߓ�*������C�q���!�oI����IFNR)����c