# Copyright (C) 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

L_DEFS := -DHAVE_CONFIG_H \
	-DVARLIB_DIR="\"/data/local/tmp/netdata/varlib\"" \
	-DCONFIG_DIR="\"/data/local/tmp/netdata/conf.d\"" \
	-DWEB_DIR="\"/data/local/tmp/netdata/web\"" \
	-DPLUGINS_DIR="\"/data/local/tmp/netdata/plugins.d\"" \
	-DCACHE_DIR="\"/data/local/tmp/netdata/cache\"" \
	-DLOG_DIR="\"/data/local/tmp/netdata/log\""
L_CFLAGS := $(L_DEFS)

netdata_SOURCES := \
	src/appconfig.c \
	src/avl.c \
	src/backends.c \
	src/common.c \
	src/daemon.c \
	src/dictionary.c \
	src/eval.c \
	src/global_statistics.c \
	src/health.c \
	src/log.c \
	src/main.c \
	src/plugin_checks.c \
	src/plugin_idlejitter.c \
	src/plugin_nfacct.c \
	src/plugin_proc.c \
	src/plugins_d.c \
	src/plugin_tc.c \
	src/popen.c \
	src/proc_diskstats.c \
	src/procfile.c \
	src/proc_interrupts.c \
	src/proc_loadavg.c \
	src/proc_meminfo.c \
	src/proc_net_dev.c \
	src/proc_net_ip_vs_stats.c \
	src/proc_net_netstat.c \
	src/proc_net_rpc_nfs.c \
	src/proc_net_rpc_nfsd.c \
	src/proc_net_snmp6.c \
	src/proc_net_snmp.c \
	src/proc_net_softnet_stat.c \
	src/proc_net_stat_conntrack.c \
	src/proc_net_stat_synproxy.c \
	src/proc_self_mountinfo.c \
	src/proc_softirqs.c \
	src/proc_stat.c \
	src/proc_sys_kernel_random_entropy_avail.c \
	src/proc_vmstat.c \
	src/registry.c \
	src/rrd2json.c \
	src/rrd.c \
	src/storage_number.c \
	src/sys_fs_cgroup.c \
	src/sys_kernel_mm_ksm.c \
	src/unit_test.c \
	src/url.c \
	src/web_buffer.c \
	src/web_buffer_svg.c \
	src/web_client.c \
	src/web_server.c \

apps_plugin_SOURCES = \
	src/appconfig.c \
	src/apps_plugin.c \
	src/avl.c \
	src/common.c \
	src/log.c \
	src/procfile.c \
	src/web_buffer.c \

include $(CLEAR_VARS)
LOCAL_MODULE := netdata
LOCAL_32_BIT_ONLY := true
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_CFLAGS := $(L_CFLAGS)
LOCAL_C_INCLUDES := src external/e2fsprogs/lib external/jemalloc/include external/zlib
LOCAL_STATIC_LIBRARIES := libz libext2_uuid_static
LOCAL_SRC_FILES := $(netdata_SOURCES)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := apps.plugin
LOCAL_32_BIT_ONLY := true
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_CFLAGS := $(L_CFLAGS)
LOCAL_C_INCLUDES := src external/e2fsprogs/lib external/jemalloc/include external/zlib
LOCAL_STATIC_LIBRARIES := libz
LOCAL_SRC_FILES := $(apps_plugin_SOURCES)
include $(BUILD_EXECUTABLE)
