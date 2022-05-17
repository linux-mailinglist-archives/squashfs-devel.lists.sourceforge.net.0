Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D923652E34A
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZl-0007O4-LF; Fri, 20 May 2022 03:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqsYr-0000qR-Nm
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 08:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+R+fxU+HB5gKOLIq4R9U6MpMKxamVRAqOnvuBWzswog=; b=B4x90jx6aimWvwfqt3aZ6sJc3u
 yIhj4TGLzdrCEG4zdlcR+pe/jJWyddK5pfv7WurIh+Na194I6v6la+z5gIBIC4WUJywBOsj/qg/Mu
 zdm+M6dbZMboAuM7qterL1Wa2I5wTn/WrCzfYHkVRd2p5jBzTwTHIQ6qc2/8zU9xRvE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+R+fxU+HB5gKOLIq4R9U6MpMKxamVRAqOnvuBWzswog=; b=c0LKNpqoNbAroNpfrwlEVtQMi7
 LLvWeZxPYt7M4MX0nYzsUbB9OmtvMN7v/pm834A4+HdxIJP4TadINdoNmdGofscEUQ+ET8OlX46Oo
 T7CVHbRENc932pjHwU0BAU7IgtSFb4b9Vh810xq9IVNaLFBMd6EEnyhcDGTwwntwt+Gc=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqsYp-0004lI-GE
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 08:28:08 +0000
Received: by mail-pf1-f173.google.com with SMTP id j6so16228906pfe.13
 for <squashfs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+R+fxU+HB5gKOLIq4R9U6MpMKxamVRAqOnvuBWzswog=;
 b=m3EFejuWwJKbr8acWHYt1jcKH1XPKtFgaFUPy58b25qXx9yCAoCuerpQi4PbWKF27G
 hGHiDFPzoph/KDl9JYmlHIYxwQqIt1ZjhgiRd6QDvDvAZSXs808vVl3+58ngkfAoA8rl
 ISEXhRBLuWXeOyCpeTrupazy1U4QHKCuRDBUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+R+fxU+HB5gKOLIq4R9U6MpMKxamVRAqOnvuBWzswog=;
 b=LjNtTNC5VNApCqLXg1idOvvi8Fy667bnVAbpQN9aPx3N5GzV+dG24d4mzHvMEgxjBM
 DMBR7x1wAhv8PsW6eCf4pgNC3Nq54FfZP67T1oR0xEcaIPAoObH7SjtZmYlg+FV7mZXJ
 +YqkVNzQSBMO9woUxdMLpmWa5IYW7YMWSRgCnxqeEJNmJi8wS73dnHh86dRfTvVzesMo
 8f7U1J3fLc9dlTijDn9f1bXRTi26rrUAfPZ7QF6bLTqt+3hxp8NW9yTAmBX0RLoougGw
 8FC1RkmU6/3QrKOY14WMfQ235BSPsT8XwxpUb25cxgrLf+ubvuvfI4sJfoiPRAyRv62A
 sElA==
X-Gm-Message-State: AOAM532l0Cv8b128jBvSkJQyTKOacY+qQ/b6/H5xBdPhSjJcl7Us8FU6
 MmPDgsDrNXqaCMgfa9XYVrfr8g==
X-Google-Smtp-Source: ABdhPJxTRQM6mw43bwjZ0jYUndKgxmKDCioKQ+bdLyU0Z5Ic7AFcCEZavy5zlfYApCDIc7k2AI2kQA==
X-Received: by 2002:a05:6a00:f85:b0:518:10e1:86b with SMTP id
 ct5-20020a056a000f8500b0051810e1086bmr97209pfb.34.1652776081745; 
 Tue, 17 May 2022 01:28:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:beb2:ec58:2159:9a33])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a628409000000b0050dc76281d3sm8615083pfd.173.2022.05.17.01.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 01:28:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Tue, 17 May 2022 16:26:52 +0800
Message-Id: <20220517082650.2005840-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220517082650.2005840-1-hsinyi@chromium.org>
References: <20220517082650.2005840-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Phillip Lougher <phillip@squashfs.org.uk>
 Squashfs_readahead
 uses the "file direct" version of the page actor,
 and so build it unconditionally.
 Reported-by: kernel test robot <lkp@intel.com> Signed-off-by: Phillip Lougher
 <phillip@squashfs.org.uk> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
 --- fs/squashfs/Makefile | 4 ++-- fs/squashfs/ [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.173 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqsYp-0004lI-GE
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:11 +0000
Subject: [Squashfs-devel] [PATCH v2 2/3] squashfs: always build "file
 direct" version of page actor
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

From: Phillip Lougher <phillip@squashfs.org.uk>

Squashfs_readahead uses the "file direct" version of the page
actor, and so build it unconditionally.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 fs/squashfs/Makefile     |  4 ++--
 fs/squashfs/page_actor.h | 41 ----------------------------------------
 2 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/fs/squashfs/Makefile b/fs/squashfs/Makefile
index 7bd9b8b856d0..477c89a519ee 100644
--- a/fs/squashfs/Makefile
+++ b/fs/squashfs/Makefile
@@ -5,9 +5,9 @@
 
 obj-$(CONFIG_SQUASHFS) += squashfs.o
 squashfs-y += block.o cache.o dir.o export.o file.o fragment.o id.o inode.o
-squashfs-y += namei.o super.o symlink.o decompressor.o
+squashfs-y += namei.o super.o symlink.o decompressor.o page_actor.o
 squashfs-$(CONFIG_SQUASHFS_FILE_CACHE) += file_cache.o
-squashfs-$(CONFIG_SQUASHFS_FILE_DIRECT) += file_direct.o page_actor.o
+squashfs-$(CONFIG_SQUASHFS_FILE_DIRECT) += file_direct.o
 squashfs-$(CONFIG_SQUASHFS_DECOMP_SINGLE) += decompressor_single.o
 squashfs-$(CONFIG_SQUASHFS_DECOMP_MULTI) += decompressor_multi.o
 squashfs-$(CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU) += decompressor_multi_percpu.o
diff --git a/fs/squashfs/page_actor.h b/fs/squashfs/page_actor.h
index 2e3073ace009..26e07373af8a 100644
--- a/fs/squashfs/page_actor.h
+++ b/fs/squashfs/page_actor.h
@@ -6,46 +6,6 @@
  * Phillip Lougher <phillip@squashfs.org.uk>
  */
 
-#ifndef CONFIG_SQUASHFS_FILE_DIRECT
-struct squashfs_page_actor {
-	void	**page;
-	int	pages;
-	int	length;
-	int	next_page;
-};
-
-static inline struct squashfs_page_actor *squashfs_page_actor_init(void **page,
-	int pages, int length)
-{
-	struct squashfs_page_actor *actor = kmalloc(sizeof(*actor), GFP_KERNEL);
-
-	if (actor == NULL)
-		return NULL;
-
-	actor->length = length ? : pages * PAGE_SIZE;
-	actor->page = page;
-	actor->pages = pages;
-	actor->next_page = 0;
-	return actor;
-}
-
-static inline void *squashfs_first_page(struct squashfs_page_actor *actor)
-{
-	actor->next_page = 1;
-	return actor->page[0];
-}
-
-static inline void *squashfs_next_page(struct squashfs_page_actor *actor)
-{
-	return actor->next_page == actor->pages ? NULL :
-		actor->page[actor->next_page++];
-}
-
-static inline void squashfs_finish_page(struct squashfs_page_actor *actor)
-{
-	/* empty */
-}
-#else
 struct squashfs_page_actor {
 	union {
 		void		**buffer;
@@ -76,4 +36,3 @@ static inline void squashfs_finish_page(struct squashfs_page_actor *actor)
 	actor->squashfs_finish_page(actor);
 }
 #endif
-#endif
-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
