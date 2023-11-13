class SenaraiProgramModel{
	final String jabatan;
	final List<String> programs;
  //final String imageLink;

	SenaraiProgramModel({required this.jabatan, required this.programs});
}


List<SenaraiProgramModel> senaraiPrograms = [
  SenaraiProgramModel(
    jabatan: "Jabatan Teknologi Mekanikal dan Pembuatan",
    programs: [
      'Program Teknologi Automotif',
      'Program Teknologi Pemesinan Industri',
      'Program Teknologi Kimpalan',
      'Program Teknologi Penyejukan & Penyamanan Udara',
    ],
  ),
  SenaraiProgramModel(
    jabatan: "Jabatan Teknologi Elektrik dan Elektronik",
    programs: [
      'Program Teknologi Elektrik',
      'Program Teknologi Elektronik',
    ],
  ),
  SenaraiProgramModel(
    jabatan: "Jabatan Teknologi Awam",
    programs: [
      'Program Teknologi Pembinaan',
    ],
  ),
  SenaraiProgramModel(
    jabatan: "Jabatan Teknologi Maklumat",
    programs: [
      'Program Teknologi Maklumat',
    ],
  ),
  SenaraiProgramModel(
    jabatan: "Jabatan Perniagaan",
    programs: [
      'Program Perakaunan',
    ],
  ),
  SenaraiProgramModel(
    jabatan: "Jabatan Pendidikan Umum",
    programs: [
      'Program Pendidikan Umum',
    ],
  ),
];