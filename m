Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 081E0531543
	for <lists+squashfs-devel@lfdr.de>; Mon, 23 May 2022 19:30:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1ntBsq-0000zK-Uk; Mon, 23 May 2022 17:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nt23O-0000MI-8H
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l9zzjHGygGfmD2mjiCjABBiOJyHxbV3Xb2gkS3Lpi4w=; b=CSQG17QpVS2HkxxK/M2GdJVIHC
 FPQn6gNslLb7q4p4euP2ApDOVZWI6Za1ajDZ8S/23v6Q5kI1T8ZiPG6/McNGgg6j4GSMMllAlTqHc
 QlVEVljGh+4AIiL/uTjFDKvxvj+j1mombTyMLprhy64lQ3EowTd4ptr11c+q0bz/tFnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l9zzjHGygGfmD2mjiCjABBiOJyHxbV3Xb2gkS3Lpi4w=; b=UZFaOUR2pMK6bSEm/2dnQchN/L
 ZE7AHZ/YNUg7QYhJlukhOZAH5Nqpgri0HBX/5zCI7clrup0rMvbIZfZOCIfrJiPuy/WwFkTxj4x7S
 P+ac2JTBRIjfQ3HquY7FMsMvmHcNx6bLVzR4TbcfsSZWHn+d2/YaBIb7aVNT2DYTzzJE=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nt22y-0005cc-Hg
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:00:15 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 nk9-20020a17090b194900b001df2fcdc165so16704059pjb.0
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 23 May 2022 00:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9zzjHGygGfmD2mjiCjABBiOJyHxbV3Xb2gkS3Lpi4w=;
 b=iQ6M1fZ5Q3+FC+7blG98I3zIIvX/yTF2CLpnO+Hh13i/JAHcQd87xBGJTrWupW27XH
 Sb1AwdIpu2meybIIwwOeh6fZAOUOQu5fRyD4FaoWpcCzLONtTAcyZs5cXuuRotq2WTUE
 3xdrV3vWw3+v0DzRExLgBNJncwKj+Sm+Aj8vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9zzjHGygGfmD2mjiCjABBiOJyHxbV3Xb2gkS3Lpi4w=;
 b=vl6yDAQxHemGxhAK0Muv+xhKDVy1T/Ki6VpbKHLYkisaNV1iAsIUPrtcMZ3NG00N7n
 zZdYNX9mjpqInYJUPDrv19tOnpR26XeSX5bqgrAZReEoPZiIbwETd9D5Tkk/IC1JdDQU
 qr+b0WlIIia/mVhvMXnPN98GlfD3/TQQGLKY3SaFSKfWCUDS31EXdst03bhAFtKJtIOc
 w1hfqspXqzDt5Ezw9Ajy5lMI9ViIHVdek03rIZL/RKvqfiOhd9kJuqgUEHKVDFTXxIq7
 uRUg2yQGWpQFcZ+qllbEQW+guU7gc9lgUwWxmWzJj5m2P+d0Mf1uBgYyTgQWfanNus+M
 95qw==
X-Gm-Message-State: AOAM531s/+vVtpk64C71Yvh9/7JSGcfmXwv0hsmohY9lShhUwZERHxVN
 1jfh9IQxS6rt3yNb7DSTHevspg==
X-Google-Smtp-Source: ABdhPJyuPsrnOB4bRdIX3zgGhGWxkP1cXNBva/WVX5JNyJKxhRqlesxK7b7121frjUkQT2vBRVSNVQ==
X-Received: by 2002:a17:90a:1b6c:b0:1df:6940:e856 with SMTP id
 q99-20020a17090a1b6c00b001df6940e856mr25130152pjq.240.1653289201243; 
 Mon, 23 May 2022 00:00:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:76d5:494d:1690:d003])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a629402000000b005180f4733a8sm3099527pfe.106.2022.05.22.23.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 00:00:00 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Mon, 23 May 2022 14:59:11 +0800
Message-Id: <20220523065909.883444-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523065909.883444-1-hsinyi@chromium.org>
References: <20220523065909.883444-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
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
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nt22y-0005cc-Hg
X-Mailman-Approved-At: Mon, 23 May 2022 17:30:18 +0000
Subject: [Squashfs-devel] [PATCH v3 2/3] squashfs: always build "file
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
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
