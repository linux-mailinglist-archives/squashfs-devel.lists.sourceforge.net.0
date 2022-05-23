Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4630531540
	for <lists+squashfs-devel@lfdr.de>; Mon, 23 May 2022 19:30:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1ntBsq-0000zG-Td; Mon, 23 May 2022 17:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nt22p-0001FN-Ua
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 06:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HDi9xEtp8+cj5bsf5JN5+R5BFytv9jkvX5VZGd9dnU0=; b=AipWeP3Gn4ZG7u8Jqtq5SDaUjT
 EAK3UHogLSYbc6hzqaQlMTDTmdImJGzHFtzFWruIBMdwahbXNgVqY8sjIYGzGuGfl/Gem6swthjik
 TC1ZaNtgrED9nit7LWM9e2p4zWp8mpzOqa/9Ux1NmAl1SBKEoP9f2ST9QHrmSPBkP+O4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HDi9xEtp8+cj5bsf5JN5+R5BFytv9jkvX5VZGd9dnU0=; b=WceKXeyny30/VHI3cwdIopHopO
 xf4q5j9AamYijLtrvuV9EeAnEt5p18BxOPsVOM1ujL6dHhzzTGJ0pZskYtc2SCuPdwYIYZqI/jTWy
 ek2MhelOD0KNCpsIvDDkNIBV09k335vIDy99b9ogk6v4vLHxc5JoAQyVbEeoaxJUYktw=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nt22n-001xcg-Oi
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 06:59:58 +0000
Received: by mail-pf1-f176.google.com with SMTP id c14so12885949pfn.2
 for <squashfs-devel@lists.sourceforge.net>;
 Sun, 22 May 2022 23:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDi9xEtp8+cj5bsf5JN5+R5BFytv9jkvX5VZGd9dnU0=;
 b=UxqkeG4TS7Vls3G5OKJGYepxuYjCZ6IqBoXYMtw9AN7M89IC4p4tPHJspPyVwwNDPz
 bYcgjDax771MYz9EiTay7QZhCfg2Pvkqx1v/ArsV2Sxu74SUvjVz2R6Eo8P7Gd8o/X5d
 FpFXd96eS2on1YHqFDjZE6a9RnvvkboSSOBSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDi9xEtp8+cj5bsf5JN5+R5BFytv9jkvX5VZGd9dnU0=;
 b=dmV9F+O1Y6tJUNPV0YhLN+KOVuGCtWQTwHviRm234RkTTTeIog30/PcM67/HhQU4kq
 l+mo4l666KmPQlO4rYG8Ofe0wQCYHKndjnuJ6uVmeUkQsD5uo1MI6qazHU8hIPN1VVWL
 lXZ9sD698MepDzV3rEGjwT1LLwWhW4N4l/Zy1zPE/Bp2sbH/mWnGTqA1HPN0NaidCMk1
 EYEPtF5ZerVTeBjHXNzDiDrlwxUQkwWCBqLUAaT5IK/MKKj0l5ntRXZjHFPn5q70jUDP
 Hl1y5GexGLIUCTkVY32TP1wO+39GCOZXFcje5m+v+NykAA2kUO4oqCtbNtfShkd/IIG9
 w5XQ==
X-Gm-Message-State: AOAM531qKT6yhm3IMQeJIBf2aj7YjI+41H7N40fA56Y8SyYZSA5C1q/j
 Bw1yX8ZvA/hyQvr+rZmT2l6yQA==
X-Google-Smtp-Source: ABdhPJxTXxgVtmCDvjsu+UF9iPAHjiAob+1BBg8pK++x+mFwZJSzqMQrBWqk7s5ILPFs5E8RXtjNgQ==
X-Received: by 2002:a05:6a00:8cb:b0:510:9ec4:8f85 with SMTP id
 s11-20020a056a0008cb00b005109ec48f85mr22585467pfu.24.1653289191034; 
 Sun, 22 May 2022 23:59:51 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:76d5:494d:1690:d003])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a629402000000b005180f4733a8sm3099527pfe.106.2022.05.22.23.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 23:59:50 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Mon, 23 May 2022 14:59:09 +0800
Message-Id: <20220523065909.883444-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523065909.883444-1-hsinyi@chromium.org>
References: <20220523065909.883444-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit 9eec1d897139e5de287af5d559a02b811b844d82.
 Revert closing the readahead to squashfs since the readahead callback for
 squashfs is implemented. Suggested-by: Xiongwei Song
 <Xiongwei.Song@windriver.com>
 Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org> --- fs/squashfs/super.c
 | 33 1 file changed, 33 deletions( [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.176 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nt22n-001xcg-Oi
X-Mailman-Approved-At: Mon, 23 May 2022 17:30:18 +0000
Subject: [Squashfs-devel] [PATCH v3 1/3] Revert "squashfs: provide
 backing_dev_info in order to disable read-ahead"
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

This reverts commit 9eec1d897139e5de287af5d559a02b811b844d82.

Revert closing the readahead to squashfs since the readahead callback
for squashfs is implemented.

Suggested-by: Xiongwei Song <Xiongwei.Song@windriver.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 fs/squashfs/super.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 6d594ba2ed28..32565dafa7f3 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -29,7 +29,6 @@
 #include <linux/module.h>
 #include <linux/magic.h>
 #include <linux/xattr.h>
-#include <linux/backing-dev.h>
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
@@ -113,24 +112,6 @@ static const struct squashfs_decompressor *supported_squashfs_filesystem(
 	return decompressor;
 }
 
-static int squashfs_bdi_init(struct super_block *sb)
-{
-	int err;
-	unsigned int major = MAJOR(sb->s_dev);
-	unsigned int minor = MINOR(sb->s_dev);
-
-	bdi_put(sb->s_bdi);
-	sb->s_bdi = &noop_backing_dev_info;
-
-	err = super_setup_bdi_name(sb, "squashfs_%u_%u", major, minor);
-	if (err)
-		return err;
-
-	sb->s_bdi->ra_pages = 0;
-	sb->s_bdi->io_pages = 0;
-
-	return 0;
-}
 
 static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 {
@@ -146,20 +127,6 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	TRACE("Entered squashfs_fill_superblock\n");
 
-	/*
-	 * squashfs provides 'backing_dev_info' in order to disable read-ahead. For
-	 * squashfs, I/O is not deferred, it is done immediately in read_folio,
-	 * which means the user would always have to wait their own I/O. So the effect
-	 * of readahead is very weak for squashfs. squashfs_bdi_init will set
-	 * sb->s_bdi->ra_pages and sb->s_bdi->io_pages to 0 and close readahead for
-	 * squashfs.
-	 */
-	err = squashfs_bdi_init(sb);
-	if (err) {
-		errorf(fc, "squashfs init bdi failed");
-		return err;
-	}
-
 	sb->s_fs_info = kzalloc(sizeof(*msblk), GFP_KERNEL);
 	if (sb->s_fs_info == NULL) {
 		ERROR("Failed to allocate squashfs_sb_info\n");
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
