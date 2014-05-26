�   ( D\OSD�;S�  skin.dmf macro "macro"
	elem 
		name = "CENTER+REP"
		command = ".center"
		is-disabled = false
	elem 
		name = "NORTHEAST+REP"
		command = ".northeast"
		is-disabled = false
	elem 
		name = "SOUTHEAST+REP"
		command = ".southeast"
		is-disabled = false
	elem 
		name = "SOUTHWEST+REP"
		command = ".southwest"
		is-disabled = false
	elem 
		name = "NORTHWEST+REP"
		command = ".northwest"
		is-disabled = false
	elem 
		name = "WEST+REP"
		command = ".west"
		is-disabled = false
	elem 
		name = "NORTH+REP"
		command = ".north"
		is-disabled = false
	elem 
		name = "EAST+REP"
		command = ".east"
		is-disabled = false
	elem 
		name = "SOUTH+REP"
		command = ".south"
		is-disabled = false
	elem 
		name = "D"
		command = "Eat"
		is-disabled = false
	elem 
		name = "O"
		command = "OOC"
		is-disabled = false
	elem 
		name = "S"
		command = "Say"
		is-disabled = false


menu "menu"
	elem 
		name = "&File"
		command = ""
		category = ""
		is-checked = false
		can-check = false
		group = ""
		is-disabled = false
		saved-params = "is-checked"
	elem 
		name = "&Quit"
		command = ".quit"
		category = "&File"
		is-checked = false
		can-check = false
		group = ""
		is-disabled = false
		saved-params = "is-checked"


window "default"
	elem "default"
		type = MAIN
		pos = 144,0
		size = 640x480
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #0080ff
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = none
		drop-zone = false
		right-click = false
		saved-params = "pos;size;is-minimized;is-maximized"
		on-size = ""
		title = ""
		titlebar = true
		statusbar = true
		can-close = true
		can-minimize = true
		can-resize = true
		is-pane = false
		is-minimized = false
		is-maximized = false
		can-scroll = none
		icon = ""
		image = ""
		image-mode = stretch
		keep-aspect = false
		transparent-color = none
		alpha = 255
		macro = "macro"
		menu = "menu"
		on-close = ""
	elem "button2"
		type = BUTTON
		pos = 344,88
		size = 56x40
		anchor1 = 54,18
		anchor2 = 63,27
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = none
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "is-checked"
		on-size = ""
		text = "Help"
		image = ""
		command = "Help"
		is-flat = false
		stretch = false
		is-checked = false
		group = ""
		button-type = pushbutton
	elem "button1"
		type = BUTTON
		pos = 344,8
		size = 56x40
		anchor1 = 54,2
		anchor2 = 63,10
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = none
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "is-checked"
		on-size = ""
		text = "Changelog"
		image = ""
		command = "Changelog"
		is-flat = false
		stretch = false
		is-checked = false
		group = ""
		button-type = pushbutton
	elem "info1"
		type = INFO
		pos = 408,8
		size = 224x160
		anchor1 = 64,2
		anchor2 = 99,35
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #ffffff
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = sunken
		drop-zone = false
		right-click = false
		saved-params = ""
		on-size = ""
		highlight-color = #00ff00
		tab-text-color = #000000
		tab-background-color = none
		tab-font-family = ""
		tab-font-size = 0
		tab-font-style = ""
		allow-html = true
		multi-line = true
		on-show = ""
		on-hide = ""
		on-tab = ""
		prefix-color = none
		suffix-color = none
	elem "input1"
		type = INPUT
		pos = 8,416
		size = 624x56
		anchor1 = 0,100
		anchor2 = 100,100
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #ffffff
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = sunken
		drop-zone = false
		right-click = false
		saved-params = ""
		on-size = ""
		command = ""
		multi-line = false
		is-password = false
		no-command = false
	elem "output1"
		type = OUTPUT
		pos = 344,176
		size = 288x232
		anchor1 = 54,37
		anchor2 = 99,85
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #ffffff
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = sunken
		drop-zone = false
		right-click = false
		saved-params = "max-lines"
		on-size = ""
		link-color = #0000ff
		visited-color = #ff00ff
		style = ""
		enable-http-images = false
		max-lines = 1000
		image = ""
	elem "map1"
		type = MAP
		pos = -24,-8
		size = 360x416
		anchor1 = 0,0
		anchor2 = 53,85
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = none
		background-color = none
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = sunken
		drop-zone = true
		right-click = false
		saved-params = "icon-size"
		on-size = ""
		icon-size = 32
		text-mode = false
		letterbox = true
		zoom = 1
		on-show = ""
		on-hide = ""
		style = ""

window "window1"
	elem "window1"
		type = MAIN
		pos = 281,0
		size = 400x405
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = none
		is-visible = false
		is-disabled = false
		is-transparent = false
		is-default = false
		border = sunken
		drop-zone = false
		right-click = false
		saved-params = "pos;size;is-minimized;is-maximized"
		on-size = ""
		title = ""
		titlebar = false
		statusbar = false
		can-close = false
		can-minimize = false
		can-resize = false
		is-pane = true
		is-minimized = false
		is-maximized = false
		can-scroll = both
		icon = ""
		image = ""
		image-mode = stretch
		keep-aspect = false
		transparent-color = none
		alpha = 255
		macro = ""
		menu = ""
		on-close = ""

#  �
z\OS�h9S  up.dmi �PNG

   IHDR   `   `   �j   PLTE���   ��� f �    f��3���R>�   tRNS @��f   �zTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT S)�(55�D��3%��(`�řV���
aÕ��VT��HXQqzNbq1AeY��٩��+ �Ό�Ҵ4�v*+���� Y[?0"�  IDATX��m�0�Y��+���]@�@~����`7p|��Ɛ���d��}!Y�	��ʺ�)�PZ0t�:)K3�n����vJ���\k�B0
'�-��dC5~�]�`"��q�;#\��}�0��q\��DT(��n�쒴o��0�l��"�F�ƃ+k�_���(PG�(eG�����<U�<1�T]
xp0RE��PBj�5��^�0�A�&�O���h\I�&�/��@J��cQ/j�q�    IEND�B`�:  !d��\OS�h9S   down.dmi �PNG

   IHDR   `   `   �j   PLTE��� f �     ���  f��3���MOa�   tRNS @��f   �zTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT S)�(55�D��3%��(`�řV���
aÕ��VT��HXQqzNbq1AeĘU�����JX]FriZN;�\�\�� �[?, 
e  IDATX����0��Z��  �N�HUؠ�?B� �cc��Ȼ��9�O��2�$ߵ�� �<�d���" �!�9`؀�;M� XdC�z�Ш@I ��6�#@� � .�<�3m��sպ����u_�� ?}�mW`f�0B��׈@��| �3��� ��mXF�� <��$:��0+@�2�!�K�-����$ c���8b�%�Z��_h�7%�!퐕u'1#CV�n6ހ�{����3-����� �-Y�`����������N%.>�@�    IEND�B`��   F7j\OS�h9S�  help.htm <HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">
<META NAME="Generator" CONTENT="Internet Assistant for Word Version 3.0">
</HEAD>
<BODY>

<B><I><U><FONT SIZE=7><P ALIGN="CENTER">How To Play Flooshland:</P>
</B></U></FONT><FONT SIZE=5><P ALIGN="CENTER">An un-comprehensive guide.</P>
<P ALIGN="CENTER"></P>
</I></FONT><P>So, you just joined the game. Amazing. Flooshland is a game of adventure, exploration, and discovery. All suggestions go to Rogue Forums. Click an object to move it to your square. Right-Click it and pick it up to move it into your inventory. All objects have many options, many for you to figure out. You must equip weapons to use them. Once a weapon is equipped Double Click (for melee) or Click (for ranged weapons) a target to shoot. Fun, right? Axes can be used to cut down trees, which gives you wood to build with. You can also plant seeds from trees. If you eat grass, it will reveal dirt. Amazing. Flooshes are amazing. They have unique digestive tracks. Eat some dirt to bore into the depths below and explore. Above all explore. There are many unexpected things awaiting you.</P></BODY>
</HTML>
�    X];\OS��;S�  change.htm <HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">
<META NAME="Generator" CONTENT="Internet Assistant for Word Version 3.0">
</HEAD>
<BODY>

<B><U><FONT FACE="Calibri" SIZE=6 COLOR="#ff0000"><P ALIGN="CENTER">FLOOSHLAND </FONT><FONT FACE="Calibri" SIZE=6 COLOR="#0000ff">CHANGELOG</P>
<P ALIGN="CENTER"></P>
</U></FONT><FONT FACE="Calibri" SIZE=5><P>Devloped by: </B>Vivalas, DXblueshadow</P>

<P ALIGN="CENTER">&nbsp;</P>
</FONT><B><I><U><FONT FACE="Calibri" SIZE=6><P>April 2nd 2014</P>
</I>
</B></U></FONT><I><FONT FACE="Calibri" SIZE=5><P>Updated by </FONT><FONT FACE="Calibri" SIZE=5 COLOR="#ff0000">Vivalas</P>

<P>&#9;</I></FONT><B><FONT FACE="Calibri" SIZE=5>Added le fancy skin. </P>

</FONT><I><U><FONT FACE="Calibri" SIZE=6><P>April 1st 2014</P>
</B></U></FONT><FONT FACE="Calibri" SIZE=5>
<P>Updated by </FONT><FONT FACE="Calibri" SIZE=5 COLOR="#ff0000">Vivalas</P>

<P>&#9;</I></FONT><B><FONT FACE="Calibri" SIZE=5>Added stone, pickaxes, and new z-levels to explore, a changelog, and not much more!</P>

<P>&#9;Happy April Fools Day!</P>
</B></FONT><I><FONT FACE="Calibri" SIZE=5 COLOR="#ff0000"><P ALIGN="CENTER"></P></I></FONT></BODY>
</HTML>
  ��N\OSL�;S�  floosh.dmi �PNG

   IHDR         nAC%   PLTE���   �� ���S�"�   tRNS @��f   �zTXtDescription  x����
�0D��W��*�� �H��`�!�5Y��$��o�`UZ-{�Y�7�]�/J�
z��h�e�|AI�«`�%
P*�繇 ��Q"к`���-��ӯ�����o�h�D�m�.�}�g_�ZS;�#E���XhP���@���08I&��M_��'�w�G*i��2{��*�u���  �IDATx��[]o�%KH�����'�[t�+4Eh��-"a��)�l�+T ����'06"�ʒ��K��3�����H�IIG�4?/i���?i������ӰA�A��-H�]��ٛ���.NoFc-��6J�*������%ݗ�K���e��Ká�8���r�=��kb"�/D�;&FY�i'�~�(��1�BZ�������x���,��;�`�"["CD�Vۺ�.͵kZ���Y�k�G��rf&�[}֯�����m��v	��q����{�uL�t�*كU�DeEi��RH���i�-�e�(��늉WU�7V�ъ�%�u��_�I���*�=�j,{�Ks����++��A��6x�u�зn�A�Skw�ރ.mɣuGDu؂(�v�5I��Ie��\'�E���P�L��v��/��A���tF��摱{��GbZ�DIeR'Ke�������b�H̠E�ޣ�x�9`oЭ�fu䱫
��G���;�v��=���_���^��O�-��7�2���P�a�����K2fc��H7�2I����w�����.إ�Co��7�\ � �X��Sl
t.Ѕ1���4O��5���R�mp�7��n��ն�x���+3�������?�$�}�l �H���P	85L4�	��Z�D7�uW��GԊG�ɗ�$���Wb�v:��ͨB�%��л5�ګ��h?�2�[.Cfk����
�jf��I~]0��=I�xT�|�b"�GNްN��u˞0��������
�G��蜠�̶F��<X0�/�Z���(��n1%��@�p�MZs�q_k��EZ�XZ��|6�g����W|�~�uG�lHyQ�C_K�	U�}�T���-ܷ삊ċ���rL����B�~�2"�5�h(>:�q/H�/A��UՃD���\vk��'�hQ�$c���Q������h�N��h�7�d2��kY�}�sd�[�������pt�*��6]XH��)f��]�j�#�'��A�|\�1ζ?����:}c�h5k&�v,�b��QA߸�z�Z/`�;��Z�-1V)L+c�;�="L��oR���F~���3(�蛀e�7�➎
��?�<�`��wPt���
D�7�h"�^�p�20�(#�3�7r%;��(-�
qK�G��������t�Y)!j#���SDm���D�o���p�D����1.���a�P�O'��8��n��юv�_�B_D�>=�Qdg�;�E�f4;�����`�x#o:<��0�O�Pw��� �%d	G�!�5�#;`�mk��1������~�	�  ��bL�V����5/e���D0�JL$B?�N�.~�0�=^�#\��5W�l��6\y�e��y��S���q%�mW��p�U쬽庤�Po� �!Xs&��T9!*���j�Y����.����7f�a�juEDy�eW%Diɣ������yY�(KU�(������܄�I��i�2�"-�(u��v9 8L� �bPWV�=�[��[:׆�%B�S�+ 	���� bOxgY�3�8I�1� ��2߂�{�(-�q��J�{��s��L<-' ڀh�Db! ���rO7ԩ�}&�юv����hv�������d}�.�lڷ|�F�Q���a��t`�D��O���Klئ�z0Ğ1�����!oЌmj����l�� т�F8��ja�����ڈ���X�[>�0B8�Ogw@	�k)$6�TV�e={�X�$锠�������a�l�����:r�r	<�}�-��pV"�rX&��}�P� "�:D���T�M��r��/��M�醶˾cObt�W\�Rjq��F�XU��2�e�D�޳�e?.i󪔯�<�Y��"Q}�*�'�:J��X�Z�N�y�J֌b�?`����G�x�@�,M�	D�Γ��<ڢ9pI�x��D�{�	�Pb��5#�$9\?T ҈hy�=.����G&�ɐ�G߀�G���WJ'w��W�IA4Q��y�ޢ6I[f8�g�Q�d︐,ܬ=��K�ŗ6\��}`<�W�S�V����F�ϋ'S�h�){� ��3m�[ă��@ίD�`�(���2F���#����ɨRB�J:�i���!�}Ӱ����p$q�n	]��!�Ϧ�w�X7!N��X'z
�iGI��;�5�u��%@�F�@�u9�����J�I��RQ>cҲ>��0�!�iц�a����� �a<h(�Bzk��%�\�'�>Dzq!J�q���ً'Q�#>4�!��8��1Q~@z��IK�m��+c m��h5$�QO7IZז�TI~�TΧ�S�}o	O�(������*��Xg䬓tO7)<�ӶG�Ǟa����+�)����\���'� ц�f��z�;�=(��=����P�zIt�{5�U"����!�Vfݔ�*Ɛ�=��z)ثE�?��������A���ю�+�g;���OyGBw�W��j�;o4��-�dĜ�Ǝha��j���gG�獆�A]�ޒ���sOT�	�
�(��R��1��F��N1��/P¿����[R+�>Q�r^FDA�:Wg��l�ԉ�F~i��s(��F�|.m���d��ݥ���'�7櫽� �8W�9������j��0_��eM3v�8��(< 獆�*�C��E��&9�4�s�|V'>o4�W��u<�ı�1iOTV�3�7��h����oATM^�d[��7���щ:Ae�^�s�F1At�h/���a���s9��<�����y�������H���~���7}��F{�a��q�*���*H|8�g{���u2q��F��W�4�C��$�l��Oq�>N��8{�|�ȭ�w2��`)WG��s��8'���==��,%E�Q�D�_>v��ָ������ɉj��y���X^?<ʹ�BW���
�><��כּ\��D��ﺻO%���)�B�����6+˫��S�������l}��z�юv�� 	�&z4�    IEND�B`�'  �Ae�\OS�h9S  corpse.dmi �PNG

   IHDR           �g   	PLTE���   �� ����   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   @IDAT�c` �:@h�US �U+!���� r����ƕ+gM�0�V��Ȅ肛Ð	3n�v�{�
 tW�S�    IEND�B`�D  �|�*\OS�h9S"  potionbottle.dmi �PNG

   IHDR           �g   PLTE�����f��f   �U��   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   TIDAT�c` ��@YKp2`j�B�����0cjhh�1�+��^a��
e�@��_���a�����P�B ��ZA�WH �V�~��    IEND�B`�U  �]s\OS�h9S:  blood.dmi �PNG

   IHDR           szz�   izTXtDescription  x�%ǽ
� ����G�K(�� h�P�J�~��9�ލ����Xj~nH��H�ˡ%H,3��ZOm�EHpN,�R!1;��b��v
�����rFB   �IDATX��K�0D���{����ʍQ:P���-��@;DN!��/�H�;�.孭Є�  v��g �d�� fŇq~�@T��x�+P `�j���K]� Qm���T`"�=�^Dw��z�Y@��.��3@��Y����    IEND�B`��  �_1&\OShc:S�  sword.dmi �PNG

   IHDR   `   @   o=   PLTE���f���    3 ���3 3  �������   tRNS @��f   �zTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT S)/�(71G��3%��(`�řV���
aÕ��&�d`W49%5'�$���%�"�����ى�T)+����= AG<�P*   �IDATH���A
�0��"YWr�����������2��B����0�<0�Ԣȹ/g���K1Cg������ �J��÷
����
܂٣U/zt�z%�/��✈03�D�4I�|D�����&������8r�#�Ҟ/p@P���b��Ł&Ιl�H.Q`�K��V����
*�
j��E�K���    IEND�B`�  �q=i\OS�h9S�   swordo.dmi �PNG

   IHDR           I��   PLTE���  ��N+   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   "IDAT�c` ��a"
@� f< "H5�  
��]gm    IEND�B`�  �~#�\OS�h9S�  spawner.dmi �PNG

   IHDR   `   `   �j   PLTE�������    �3� ���� �u�9   tRNS @��f   �zTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT S�(5E��3%���3��L+J�M��RRs+A�:�I9����H/JM�#MKAiQAq�(+����� ��F)b$l  �IDATX��Kr�0��cX�$�5�	��0Ӄ���?B�-ɿ��O˪h�O_pdU���z���;���6������~ >7��A~8�Z�`A�A�9�h" �!� A@� d`(�4E���(�A�@��hL���
�@ `Ш@�V�@(�,��7@+����`��o��W�]����,�+V����2~}�_i���2�W����\��j0�����8� �A� >� �EP\#���	 A\>�4H@W	p��(�`>�d�3A0�k �	�|�6�S� �@(�J~�D�~u�쇣G�>z��D_Qv	�k�,�����<_Ư�÷���W8����ON����� D`��� (��� ��a��"H@(��2�.�Л �K�	�K?�* �`P����^o�O���p�h��G�7{��+�.zͰ���bŪd�1?�(�k�*q    IEND�B`�&  �|m\OS�h9S
  dsword.dmi �PNG

   IHDR   @       ��   	PLTE����    ��7v   tRNS @��f   ozTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���SRs+A�:�\�
�~.`��19	��   4IDAT(�c`�  J/�ҌP&� ���j�
�Bi-�!Pz.#�F0��0  <��o�o    IEND�B`�  �	�q\OS�h9S�   rifle.dmi �PNG

   IHDR           �g   PLTE���f  �     w枵   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   1IDAT�c`�=`t`�f�:0@��A��A�8 c Ex@���
  �y0�    IEND�B`�  �呎\OS�h9S�   rifleo.dmi �PNG

   IHDR           �Tg�   PLTE����     f    3C;<�   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   "IDAT(�c`&@ ]@�ˬ���.�*P����:  ����Wm    IEND�B`�  �[��\OS�h9S�   axeo.dmi �PNG

   IHDR           �g   	PLTE���3f�3  5ϭ   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   #IDAT�c`���L0��c��2���r�  ����+��    IEND�B`�N	  5±�\OSb:S3	  grass.dmi �PNG

   IHDR   �   �   Z(c]   �zTXtDescription  x����j1�g�)D���K�z)��;8Xw6�Q��9}�����6	>��O�>�_����W�R�
>�޽�%�{�2�%��"-6� ��F��w�T� �ws�����T*����#�N��\u,�)��U'�%\Q�pźW�VU���u�B����d���v��n�{fҝe&�{�+�Lr�~#��d=x���v��T[K/f�b����r���i�(�4K|  IDATx���?��6��J��| �=��.)��L&WHft �H:��}��N�=Sh�%)��I z�ό'����f�@�2b���.6��E^�q�/R���淸��V����8�=��������xP�߿}��� L*�X!Z��/ ��k�S9�M� ���R�����K�:� 4X��m��	 z�*~/� M*~/� �F ��j � �F t���b>������\# �5)����B�a�#UUu����܊_�3 &�+��_�3 &ʵ�C8`uƘ�Z���)" X�1F�=<zI6 � �F ��O��Dx�0�U�g�R�5" XU}�{�xV�>5t���K��Y�t �F�jw{Dn���?" �{�����j�$�{�l%��������|ey�5��c+NE�>��z��> �3@F�q=;�=�����H��c�l�@���8 #]��s���`Sh^3@ �պ����v qcB�.|�D�}߿��� �Z_���]��m�k[��os��C�@):��rg�����Ya�ѳ���z��u}�y� \�?t�@���nw�B�>4���H@����lݽ���}���e0��1@"�]����l眿w���9'"V�^���*xZ�w��4Z���{ѷ��^��c;�S�g��m��k��Rs�En�y����ܻ<����L�[��d9���]o���/��d���r��<L�>��o_۷�F�cs��\C��D�д�$�z-K�Z��("/��(��<�fN��j�.�_C-zmZ4������=� xef!(�����ݶZvW�������e�[�}V�@$��-~�}�+��,�-�3E�ݢ�e ��C���E���{���1�Q�X"�Ap({��n��Z�04&�������[�* ^�VƘŭ�XEQT�_��ޖ�9{��s���8� t���fL�� �����G�}ȭ����]���l�& T�. �C�������wcR�� �M�b���	탰���(�q��i6�����# ��FW�  O�� �#��4�r�}��Wx��0�9v`����l�#w����H�����c��*j�?l���jIt�0MWׅ��y�@__Վ��,�~O��~�=d���_����>~{��V	�4�� ��E{�
X��3��[�`=s�*��xs�xw�eFqN@����B���>%�]��]�L�-�P�L����s���C�i�ow���sb�R�S��|�.R6��>}-���s�34��S�h�����,Z
A��[�ڷ{��BX{@X�"�ۆ��b��	��T����.�mx^���"r�}z�~�&'�(b�܆�7�0�u���4�V�3V�\s��N�wt N�5nnlft�ݪO�=�'nĊ�1���1�ݗQ�mC.��ӡc�-�^~��o�b������)ݦ���[r��f����='Ź�O;��:�����Ӟ���d`ܶZ >~)ŏ�pW�F ��j � �F �ZW�c^�M��o
�A+s9J�z�����yNy�\앪6���E�w�Ş���%�3 t����3�%oJR7�1]  c���@�ҭ���1@v|��� d�^��MLKB@ ��z���@�BW�w}?u`�,�j��73𦆀.�6��	=>�;ĕ`$o�;v $m�et���@�ΘOю�,��V^c�#�1 �rN>Ļ7�# ����E9�1�A0t# P�Y ��,��^�������������!	�bZ���	�w�� $k�[��.@ꭴo��?����o�s�g���?��5���v���x׶��}0��j�A5� P� @5 ՘Bt1o�nD���,c^D�Ϙ/�⏘��� ���@L���j � �va0
����_�ϑ���s�K����j�c �F ��j � �F ��j � �F ��j � �F ��j�ө����e��C��s�#zqc,�� � �F ��j����L�,i��    IEND�B`�  ��8\OS�h9S�  objects.dmi �PNG

   IHDR   �   �   ~M(   PLTE���f3    �����3�  Fj�b   tRNS @��f   �zTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT S)��P��L�,*��8ӊsS!lTU���
p)���/).��oh�ch�����N�hjNb%HXROqIi^QfZ΀PVp�s�/ �b!f��  �IDATh��[��0EV@"�?��t������Ÿ�KF�+!�-GNr�(Uꂙծ���݆��� ��M�f2��W�_�C�@�_��7 �Ki� ��I!���cHyn�P��WD�~7���
�vl��4��`8.GN�<�ܗ�>��0)� �ە c_ B	`��L�V�;�I�7�m47t�����1l���mZ"�w��FE�Xbo���%�Kfbu���U0����8`�X��u�,񠏾�:
���!���>�D��%�@�0��a�0���h�=C�{� ����x.�@2X����/�?���s�@�%��3o},�~b�r�͇m>DϏm>��u���a�@�������C��p�Łd����&�����uH.��Hj�ںg0�4?+p��@����)�l��K��tɔ�-���#>/,��C1��fF6�>O,�=��s��zO�b����r��ra��6�:����T����    IEND�B`�  Ϧ�?\OS�h9S�   stuno.dmi �PNG

   IHDR           �g   PLTE���   f  ��3𚉙   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   IDAT�c`�;��L�?@h�� �[X��B    IEND�B`�  ���d\OS�c:S�   picko.dmi �PNG

   IHDR           �g   	PLTE��� f�3  }E>   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   )IDAT�c`� ���0#n'��	c���La�FY(q  Y�'��>    IEND�B`�