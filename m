Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3353852E342
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007IB-AR; Fri, 20 May 2022 03:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqYK7-0003rz-8L
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5RbQ3j9RMbZ/D6MAR7ISAUvOQDvpOlhf1s/Zk6REvQs=; b=OBJRe9rPzUB9Nt07D6Mt5zwDrq
 KGaLXcaq8CDGslhrwsiD3k7GchPqyyNQK+F8YDnb1l1/sa/AYC3BTshZu8KL4zgU4tsSf4NwfDB6w
 Tkms9wmQ8lyDAamBCWRCpYLHHZYwjCUhbmyRdknQhDpPrkYU1pjfJ3RPbNjo6FXJoeLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5RbQ3j9RMbZ/D6MAR7ISAUvOQDvpOlhf1s/Zk6REvQs=; b=Rh1eyf18gDa0uS5CqG7/masWOR
 teJ716etD7GS/ancV/Hydjz3VYg8V3vWAyYuRIsdfdlzE8qsXYmUzQvkIApxT/O3e5AqezZxbRQ8m
 NrgtPQGTKuxt3iLy1pM7hzB2gcxRHnNPpoKz4MlBayff0SB1IBDxO0rBYbybJSAvuu20=;
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqYK4-00GwvD-SD
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:51:33 +0000
Received: by mail-pg1-f176.google.com with SMTP id g184so13744205pgc.1
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5RbQ3j9RMbZ/D6MAR7ISAUvOQDvpOlhf1s/Zk6REvQs=;
 b=TZqROHTy4bHF74S5KUPgYAYiymslKKVBA7bRL3/HGi4JHQB8muBNwXApRa0cU+VWhS
 iDhqHMiS97n7lTt4aPXGafW1hSdMlSn0/MjzhUr5uDezSoKTsE2/fU3tuMWFAIQsDW57
 VoEjrIWGFnek4FgPEBYZGiUVXkUJq4gERo+VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5RbQ3j9RMbZ/D6MAR7ISAUvOQDvpOlhf1s/Zk6REvQs=;
 b=kKtGo/SoMRNhEWaWXeYyHqOqyPCYaEOmEbK1RJ+uLQOYN1HnBw4nZv/CUHPNjFzOzm
 0EtvDomcxz831869BXBDgmr3gYDryjTX1gYBGi8/+kwjAaUmK4HCQ4qsD4v4ISmaw6qs
 mfsCjhF+y033LxIW5WpkynAhh6QQTTmJUoXTOLDOc5P4lXX4nW9CAe5UH8sRgNqZ1nPu
 JY+E4hpoE+LWOXLIBRhii00ytTpiaqAVj7LgvGB7FnR18OKiDDublRZyo0IDJa6NTao4
 1fsbYCovEVXurER5y2/XSDHbYH35J92M8IS08Ymga984ZAuIV32p3MPb6McYhvp4zhDi
 OO6g==
X-Gm-Message-State: AOAM533BvkadxIsaqOqhIoBS3DMiQ7u6U+/5+VFm0l86odJEKvESK5du
 2VlXqn690lhSr4K8DPQUlrLqXQ==
X-Google-Smtp-Source: ABdhPJyQ5XmFT7yQ/quMHs3G1SNLRmrs0Q+kvbBJA9PMECYOuXFf5iA+2PsREWr5Wz+K7aTd/M7V3Q==
X-Received: by 2002:a63:5522:0:b0:3c5:e4be:5a49 with SMTP id
 j34-20020a635522000000b003c5e4be5a49mr14595263pgb.26.1652698286995; 
 Mon, 16 May 2022 03:51:26 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cdcb:c865:6f65:d875])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a655bce000000b003db8dd388afsm6332778pgr.10.2022.05.16.03.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:51:26 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Mon, 16 May 2022 18:51:01 +0800
Message-Id: <20220516105100.1412740-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220516105100.1412740-1-hsinyi@chromium.org>
References: <20220516105100.1412740-1-hsinyi@chromium.org>
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
 squashfs is implemented. Suggested-by: Xiongwei Song <sxwjean@gmail.com>
 Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org> --- fs/squashfs/super.c
 | 33 1 file changed, 33 deletions(-) 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.176 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqYK4-00GwvD-SD
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: [Squashfs-devel] [PATCH 1/2] Revert "squashfs: provide
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

Suggested-by: Xiongwei Song <sxwjean@gmail.com>
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
2.36.0.550.gb090851708-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
