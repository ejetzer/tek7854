# https://mg.readthedocs.io/latexmk.html

@default_files = ("Lisez-moi");
@default_excluded_files = ("preambule.tex", "details.tex");

$aux_dir = '.';
$out_dir = '.';

$pdf_mode = 1;

$use_make_for_missing_files = 1;

set_tex_cmds('--shell-escape %O %S');

# Répertoires où chercher les documents
ensure_path('TEXINPUTS', './texmf//');
ensure_path('BIBINPUTS', '../Tek7854.zotero//');
