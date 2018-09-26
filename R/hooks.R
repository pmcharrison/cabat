.onLoad <- function(libname, pkgname) {
  packageStartupMessage(
    "Note: on September 26th 2018, two changes were made to ",
    "default arguments for cabat(), demo_cabat(), and standalone_cabat():\n",
    "- next_item.estimator now defaults to 'BM', not 'WL';\n",
    "- fix_first_item now defaults to FALSE, not TRUE.\n"
  )
}
