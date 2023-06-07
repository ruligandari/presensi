-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jun 2023 pada 10.35
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_presensi`
--

CREATE TABLE `daftar_presensi` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mk` varchar(255) NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_keluar` time NOT NULL,
  `tanggal` date NOT NULL,
  `id_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `daftar_presensi`
--

INSERT INTO `daftar_presensi` (`id`, `id_kelas`, `id_mk`, `jam_masuk`, `jam_keluar`, `tanggal`, `id_dosen`) VALUES
(11, 1, '3001', '20:58:00', '23:58:00', '2023-05-09', 1),
(12, 1, '2001', '08:30:00', '09:30:00', '2023-05-09', 1),
(13, 2, '2001', '22:07:00', '23:07:00', '2023-05-09', 2),
(14, 1, '2001', '19:00:00', '20:30:00', '2023-05-10', 1),
(15, 2, '3001', '19:30:00', '20:30:00', '2023-05-10', 1),
(16, 2, '2001', '10:00:00', '11:00:00', '2023-05-12', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama`, `nip`, `email`, `password`) VALUES
(1, 'Dosen 1', '12345678', 'dosen1@gmail.com', '$2y$10$.9QXvNjswQP.Mvd/bK1CUOj3vgmHVuJzXCRL1pAvIMqweB5sH5Ff6'),
(2, 'Dosen 2', '1234567', 'dosen2@gmail.com', '$2y$10$MRbjVejc13cfGkhdPgrJp.ET0mDxetLYLVj5z10oIA97sX47uWzfe'),
(8, 'Pebi Pebriansah', '321022160200001', 'pebipebriansah160200@gmail.com', '$2y$10$u3/CDCFNCN7REGq3ts7WJeXDjBfSk7RdvAZuG6aQ6Gc4NU16j0RFO');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(1, 'TI 2017 A'),
(2, 'TI 2017 B');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `jurusan` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `ttl` varchar(100) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `data_wajah` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `id_kelas`, `jurusan`, `jenis_kelamin`, `ttl`, `agama`, `alamat`, `foto`, `data_wajah`) VALUES
('20180810025', 'Pebi Pebriansah', 1, 'Teknik Informatika', 'L', 'Majalengka 16-02-2000', 'Islam', 'Sukamanah', '1686125294_7c1f87bdfc9ffd3f840c.jpg', '-0.11568285524845123,0.12576518952846527,0.07345166802406311,-0.05193007364869118,-0.04579038918018341,-0.0041415635496377945,-0.05556686967611313,-0.06855563074350357,0.11683472245931625,-0.14574746787548065,0.27582335472106934,-0.11071770638227463,-0.22873735427856445,-0.16634075343608856,0.022123301401734352,0.17863114178180695,-0.21954278647899628,-0.14279860258102417,-0.06046033278107643,-0.003442015964537859,0.1364777833223343,0.00248129409737885,0.034670017659664154,-0.025406192988157272,-0.1789170205593109,-0.42428818345069885,-0.06557029485702515,-0.11060023307800293,-0.008939076215028763,-0.08373002707958221,-0.09245169907808304,0.04244822636246681,-0.15174873173236847,-0.04347702115774155,-0.00670602498576045,0.0711447075009346,-0.01249066274613142,-0.001227149972692132,0.14070147275924683,-0.023269474506378174,-0.24894855916500092,0.07123324275016785,0.029412267729640007,0.249778613448143,0.17247574031352997,0.08044946938753128,-0.008513415232300758,-0.08770859241485596,0.09731612354516983,-0.17152734100818634,0.08752239495515823,0.11461059749126434,0.12739375233650208,0.037915587425231934,0.09221908450126648,-0.11416326463222504,-0.019075600430369377,0.10878033190965652,-0.14325037598609924,0.012135579250752926,0.06784854829311371,-0.09431841224431992,-0.025729799643158913,-0.10682553052902222,0.18272054195404053,0.0880768820643425,-0.10973542928695679,-0.1299441009759903,0.11796782165765762,-0.0623013861477375,-0.06924138218164444,0.055242255330085754,-0.1413753628730774,-0.17055073380470276,-0.29517441987991333,0.005578272044658661,0.3139441907405853,0.08161842077970505,-0.2357693910598755,-0.00862085446715355,0.012495459988713264,0.010699194855988026,0.1584981083869934,0.12496515363454819,-0.04742110148072243,0.025657692924141884,-0.09069231152534485,0.013808227144181728,0.15931932628154755,-0.06512482464313507,-0.04551321268081665,0.20716388523578644,-0.02183389663696289,0.07258841395378113,0.03553181514143944,-0.03165315464138985,-0.07107392698526382,0.027198828756809235,-0.15202680230140686,-0.011671468615531921,0.040476731956005096,-0.0746937096118927,-0.08687827736139297,0.085475854575634,-0.13106276094913483,0.0965428426861763,0.01689624786376953,0.04214853793382645,-0.001967045711353421,0.0003642505325842649,-0.07659164071083069,-0.029060814529657364,0.08584275841712952,-0.23551729321479797,0.1638185679912567,0.21122238039970398,0.0558842234313488,0.12992410361766815,0.12696261703968048,0.018531013280153275,-0.007668603211641312,-0.012906580232083797,-0.2674582600593567,-0.027254953980445862,0.15246914327144623,-0.012641523964703083,0.08304556459188461,0.0012778559466823936'),
('20180810026', 'Ruli Gandari', 2, 'Teknik Informatika', 'L', 'Majalengka 16-02-2000', 'Islam', 'Majalengka', '1686125269_a0e1c5996ec96a3b0583.jpg', '-0.08951068669557571,0.0790179893374443,0.06658565998077393,-0.008986569941043854,-0.09495601803064346,-0.09784053266048431,-0.07581514120101929,-0.19212141633033752,0.10296492278575897,-0.12275417149066925,0.256793737411499,-0.04116841033101082,-0.14275376498699188,-0.21250019967556,-0.01042012870311737,0.17329737544059753,-0.24285168945789337,-0.1962326169013977,-0.05071311071515083,-0.0388411246240139,0.071168914437294,-0.08765960484743118,0.07374382019042969,0.059400979429483414,-0.1308390200138092,-0.36118313670158386,-0.05672002583742142,-0.09556588530540466,0.07521006464958191,-0.06156614422798157,-0.0854305624961853,0.017799142748117447,-0.27773159742355347,-0.023960238322615623,-0.08189702779054642,0.06074567139148712,0.012376178987324238,-0.09067519009113312,0.18228259682655334,-0.08492901921272278,-0.2629801332950592,0.035049766302108765,-0.02717082016170025,0.1773291826248169,0.2185736447572708,0.017116744071245193,0.0332474447786808,-0.07119428366422653,0.12890683114528656,-0.18830271065235138,0.06925206631422043,0.10549401491880417,0.07743790000677109,-0.03552941232919693,0.0018222917569801211,-0.1624843180179596,-0.03749559819698334,0.07647236436605453,-0.13778530061244965,-0.026227110996842384,0.013259594328701496,-0.08352550119161606,-0.01594976894557476,-0.11666140705347061,0.23859891295433044,0.14132702350616455,-0.08027218282222748,-0.12155898660421371,0.13120676577091217,-0.1609601378440857,-0.029897471889853477,0.06083159148693085,-0.09978348761796951,-0.15590262413024902,-0.396619975566864,-0.0057838959619402885,0.4080175757408142,0.07289035618305206,-0.21995873749256134,0.012010345235466957,-0.041686780750751495,0.024478349834680557,0.1564643532037735,0.11169329285621643,-0.07311780005693436,0.09203387796878815,-0.16539420187473297,0.019755292683839798,0.21894259750843048,-0.04229998588562012,-0.08101137727499008,0.21324282884597778,-0.009821109473705292,0.06850377470254898,0.04140021279454231,0.005485198460519314,-0.007741695269942284,0.03071388229727745,-0.11821138113737106,0.07024148106575012,0.03892376273870468,-0.018680397421121597,-0.05936146527528763,0.07504171878099442,-0.09365585446357727,0.032556742429733276,0.014886301942169666,0.029993856325745583,-0.0369657538831234,-0.02445722557604313,-0.13409677147865295,-0.09566982835531235,0.07492653280496597,-0.2520265579223633,0.19051067531108856,0.18785549700260162,0.05414273962378502,0.17672063410282135,0.0899871364235878,0.05313824489712715,-0.05585337057709694,-0.05413628742098808,-0.17073018848896027,-0.0002798383648041636,0.1467026323080063,-0.04609992727637291,0.14144471287727356,0.0554485023021698'),
('2348098001', 'Livia', 1, 'Teknik Informatika', 'P', 'Majalengka 16-02-2000', 'Hindu', 'Sukamanah', '1686125314_7597ebca5b5965aff2f0.jpeg', '-0.12610356509685516,0.0006758049130439758,0.02182701975107193,-0.09503411501646042,-0.08596963435411453,-0.059121422469615936,-0.04729900509119034,-0.14003914594650269,0.10879039019346237,-0.20956043899059296,0.24217940866947174,-0.09011837095022202,-0.2249208390712738,-0.07237447798252106,-0.050773244351148605,0.17544253170490265,-0.22332395613193512,-0.11024276912212372,-0.013713511638343334,0.011905955150723457,0.11667309701442719,-0.01901434361934662,0.0371708944439888,0.05013473331928253,-0.1213272213935852,-0.31832435727119446,-0.10318263620138168,-0.0657946765422821,-0.06478432565927505,-0.024662978947162628,0.006922320928424597,0.03355037420988083,-0.2067974954843521,0.012589826248586178,-0.013102568686008453,0.05269315093755722,0.008524284698069096,-0.09003382921218872,0.1616392433643341,-0.0025001554749906063,-0.2837682068347931,-0.09187375754117966,0.04053745046257973,0.1891186684370041,0.17284008860588074,0.03686964884400368,-0.05797944590449333,-0.09593454748392105,0.06702304631471634,-0.24295777082443237,0.015873949974775314,0.09941235184669495,0.040985673666000366,0.0033292172010987997,-0.036873023957014084,-0.12398713082075119,0.030633598566055298,0.09722355753183365,-0.15676923096179962,-0.08887409418821335,0.047874175012111664,-0.08036073297262192,-0.015194300562143326,-0.09224439412355423,0.24286173284053802,0.12775453925132751,-0.14867763221263885,-0.11658082902431488,0.16240288317203522,-0.15648388862609863,-0.045137569308280945,0.059073206037282944,-0.13877634704113007,-0.24825461208820343,-0.24618470668792725,-0.018673796206712723,0.3642919063568115,0.13326895236968994,-0.13802462816238403,0.004114559851586819,-0.056166768074035645,0.0009017857955768704,0.1453409194946289,0.17458239197731018,0.05487152189016342,0.05038684606552124,-0.0332082137465477,0.014638678170740604,0.1937892585992813,-0.10759607702493668,-0.045738887041807175,0.2512954771518707,-0.035742491483688354,0.014147254638373852,0.02373611368238926,-0.021463755518198013,-0.019640743732452393,0.06553864479064941,-0.14931237697601318,0.027402624487876892,0.002191981766372919,0.006450573448091745,-0.014989594928920269,0.11630471050739288,-0.12999889254570007,0.09345035254955292,0.006681189406663179,-0.0537598580121994,0.02027076669037342,-0.07239416241645813,-0.09054499119520187,-0.1012108102440834,0.08204558491706848,-0.20321398973464966,0.14143545925617218,0.17652183771133423,0.07603320479393005,0.1896837204694748,0.09369689226150513,0.08446862548589706,0.025341005995869637,-0.048140887171030045,-0.2361859232187271,0.005017473828047514,0.13890227675437927,-0.03747687488794327,0.09114716202020645,-0.06071695685386658');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id_mk` varchar(255) NOT NULL,
  `nama_mk` varchar(255) NOT NULL,
  `id_dosen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id_mk`, `nama_mk`, `id_dosen`) VALUES
('2001', 'Filsafat', '2'),
('3001', 'Matematika', '2'),
('3002', 'Matematika', '2'),
('3003', 'Matematika', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2023-03-16-174939', 'App\\Database\\Migrations\\DosenTable', 'default', 'App', 1678989399, 1),
(2, '2023-03-16-175739', 'App\\Database\\Migrations\\MahasiswaTabel', 'default', 'App', 1678989971, 2),
(3, '2023-03-16-180724', 'App\\Database\\Migrations\\PresensiTabel', 'default', 'App', 1678991068, 3),
(4, '2023-05-01-084555', 'App\\Database\\Migrations\\StaffTabel', 'default', 'App', 1682931203, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi`
--

CREATE TABLE `presensi` (
  `id_presensi` int(11) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mk` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `status` enum('hadir','tidak hadir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `presensi`
--

INSERT INTO `presensi` (`id_presensi`, `nim`, `id_kelas`, `id_mk`, `id`, `status`) VALUES
(1, '20180810025', 1, '3001', 11, 'tidak hadir'),
(2, '2348098001', 1, '3001', 11, 'tidak hadir'),
(3, '20180810025', 1, '2001', 12, 'tidak hadir'),
(4, '2348098001', 1, '2001', 12, 'tidak hadir'),
(5, '20180810026', 2, '2001', 13, 'tidak hadir'),
(6, '20180810025', 1, '2001', 14, 'tidak hadir'),
(7, '2348098001', 1, '2001', 14, 'tidak hadir'),
(8, '20180810026', 2, '3001', 15, 'hadir'),
(9, '20180810026', 2, '2001', 16, 'hadir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

CREATE TABLE `staff` (
  `id_staff` int(11) NOT NULL,
  `nama_staff` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `staff`
--

INSERT INTO `staff` (`id_staff`, `nama_staff`, `email`, `password`) VALUES
(1, 'Staff TU 1', 'stafftu1@gmail.com', '$2y$10$U5oDodWmTLVyRU7hp4bOuOTVqBCTYBa9VoF3pccKqMxv5X9u31Exa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_presensi`
--
ALTER TABLE `daftar_presensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mk` (`id_mk`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id_mk`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `nim` (`nim`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mk` (`id_mk`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_staff`),
  ADD UNIQUE KEY `id_staff` (`id_staff`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftar_presensi`
--
ALTER TABLE `daftar_presensi`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
