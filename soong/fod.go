package fod

import (
    "android/soong/android"
    "android/soong/cc"
    "strconv"
    "strings"
)

func deviceFlags(ctx android.BaseContext) []string {
    var cflags []string

    var config = ctx.AConfig().VendorConfig("ONEPLUS_MSMNILE_FOD")
    var hbm = strconv.FormatBool(config.Bool("HBM"))
    var posX = strings.TrimSpace(config.String("POS_X"))
    var posY = strings.TrimSpace(config.String("POS_Y"))
    var size = strings.TrimSpace(config.String("SIZE"))

    cflags = append(cflags,
            "-DFOD_HBM=" + hbm,
            "-DFOD_POS_X=" + posX,
            "-DFOD_POS_Y=" + posY,
            "-DFOD_SIZE=" + size)
    return cflags
}

func fodHalBinary(ctx android.LoadHookContext) {
    type props struct {
        Target struct {
            Android struct {
                Cflags []string
            }
        }
    }

    p := &props{}
    p.Target.Android.Cflags = deviceFlags(ctx)
    ctx.AppendProperties(p)
}

func fodHalBinaryFactory() android.Module {
    module, _ := cc.NewBinary(android.HostAndDeviceSupported)
    newMod := module.Init()
    android.AddLoadHook(newMod, fodHalBinary)
    return newMod
}

func init() {
    android.RegisterModuleType("oneplus_msmnile_fod_hal_binary", fodHalBinaryFactory)
}
