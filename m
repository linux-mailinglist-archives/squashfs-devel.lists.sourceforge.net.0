Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E512C547191
	for <lists+squashfs-devel@lfdr.de>; Sat, 11 Jun 2022 05:23:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nzriQ-00014C-LQ; Sat, 11 Jun 2022 03:23:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1nzriO-000146-Jt
 for squashfs-devel@lists.sourceforge.net; Sat, 11 Jun 2022 03:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zieHj91jN/kyGgNArhOkJAvXMRaxdAaKAzy6yw/xL4U=; b=Dx6jhuCwJYoCjQPHLzNqxJzBKv
 1HLhZkv6L7Ijyhm4UAPhxmlQvpz1VTdswGuddXUeTOBWXEYX863Z0rmiBbh5iQAU2mbgkuBmkXfAM
 mFXkURIcqDb2IbCpGyAnJEoc4rlM97q6/QiQ+rme2nZzS+zD/a7xq8dnuYNH/6wgfDIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zieHj91jN/kyGgNArhOkJAvXMRaxdAaKAzy6yw/xL4U=; b=REsmjEMm6uOQ6ZdwB/QMENlXMy
 JKb/ioQZ+t8AOq6WNZDuM8N5GzGe0XGt8UFHiW/OLY/s0UmLgTqXgWLxHCAIxjceYB4XhEMlHpKuu
 TdqhSh/QNNCWLgrX0QABKoVPNtxmY1yQEI4JUBUDxkvJCSEMvjtgs1sVr2YUTfOeB7z0=;
Received: from p3plsmtp26-01-2.prod.phx3.secureserver.net ([216.69.139.24]
 helo=p3plwbeout26-01.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nzriK-00EiwG-Is
 for squashfs-devel@lists.sourceforge.net; Sat, 11 Jun 2022 03:23:08 +0000
Received: from mailex.mailcore.me ([94.136.40.145]) by :WBEOUT: with ESMTP
 id zriAn5hkPbTGLzriBniJ9y; Fri, 10 Jun 2022 20:22:55 -0700
X-CMAE-Analysis: v=2.4 cv=cbIXElPM c=1 sm=1 tr=0 ts=62a40a8f
 a=7e6w4QD8YWtpVJ/7+iiidw==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=JPEYwPQDsx4A:10 a=FXvPX3liAAAA:8 a=EtPFtR80rDWv2_rSRC0A:9
 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: zriAn5hkPbTGL
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=localhost.localdomain)
 by smtp02.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1nzri9-0001TR-MA; Sat, 11 Jun 2022 04:22:54 +0100
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Date: Sat, 11 Jun 2022 04:21:33 +0100
Message-Id: <20220611032133.5743-3-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220611032133.5743-1-phillip@squashfs.org.uk>
References: <20220611032133.5743-1-phillip@squashfs.org.uk>
MIME-Version: 1.0
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfHY3odzcdbmAusXkgpiHdkXT1v8xSqrFZvTcv/099ixv/GGOH+XO11O1heME1CyDgkAqtHAq95uI6ulfB/lJ+wubPt1BaEXX3yNgqD+hRHLNjp+OlPrP
 oFqj1GCPVHYrXjAvbD32wpH5auOxAEggNfd64ADbuWC1wEoGLzlXRj9nX3SsT/+U/5d9kDpJQ+I9zjldReA7OcZwWqHsKUEsis/3YFhd3NkQtzXC/qD1qgOn
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that the "page actor" can handle missing pages, we don't
 have to fall back to using an intermediate buffer in Squashfs_readpage_block()
 if all the pages necessary can't be obtained. Signed-off-by: Phillip Lougher
 <phillip@squashfs.org.uk> --- fs/squashfs/file_direct.c | 75 +++++++ 1 file
 changed, 12 insertions(+), 63 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.69.139.24 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nzriK-00EiwG-Is
Subject: [Squashfs-devel] [PATCH 2/2] Squashfs: don't use intermediate
 buffer if pages missing
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
Cc: Xiongwei.Song@windriver.com, squashfs-devel@lists.sourceforge.net,
 willy@infradead.org, linux-mm@kvack.org, hsinyi@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Now that the "page actor" can handle missing pages, we don't
have to fall back to using an intermediate buffer in
Squashfs_readpage_block() if all the pages necessary can't
be obtained.

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/file_direct.c | 75 +++++++--------------------------------
 1 file changed, 12 insertions(+), 63 deletions(-)

diff --git a/fs/squashfs/file_direct.c b/fs/squashfs/file_direct.c
index 5af5802f5626..be4b12d31e0c 100644
--- a/fs/squashfs/file_direct.c
+++ b/fs/squashfs/file_direct.c
@@ -18,9 +18,6 @@
 #include "squashfs.h"
 #include "page_actor.h"
 
-static int squashfs_read_cache(struct page *target_page, u64 block, int bsize,
-	int pages, struct page **page, int bytes);
-
 /* Read separately compressed datablock directly into page cache */
 int squashfs_readpage_block(struct page *target_page, u64 block, int bsize,
 	int expected)
@@ -33,7 +30,7 @@ int squashfs_readpage_block(struct page *target_page, u64 block, int bsize,
 	int mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
 	int start_index = target_page->index & ~mask;
 	int end_index = start_index | mask;
-	int i, n, pages, missing_pages, bytes, res = -ENOMEM;
+	int i, n, pages, bytes, res = -ENOMEM;
 	struct page **page;
 	struct squashfs_page_actor *actor;
 	void *pageaddr;
@@ -48,44 +45,29 @@ int squashfs_readpage_block(struct page *target_page, u64 block, int bsize,
 		return res;
 
 	/* Try to grab all the pages covered by the Squashfs block */
-	for (missing_pages = 0, i = 0, n = start_index; i < pages; i++, n++) {
+	for (i = 0, n = start_index; n <= end_index; n++) {
 		page[i] = (n == target_page->index) ? target_page :
 			grab_cache_page_nowait(target_page->mapping, n);
 
-		if (page[i] == NULL) {
-			missing_pages++;
+		if (page[i] == NULL)
 			continue;
-		}
 
 		if (PageUptodate(page[i])) {
 			unlock_page(page[i]);
 			put_page(page[i]);
-			page[i] = NULL;
-			missing_pages++;
+			continue;
 		}
-	}
-
-	if (missing_pages) {
-		/*
-		 * Couldn't get one or more pages, this page has either
-		 * been VM reclaimed, but others are still in the page cache
-		 * and uptodate, or we're racing with another thread in
-		 * squashfs_readpage also trying to grab them.  Fall back to
-		 * using an intermediate buffer.
-		 */
-		res = squashfs_read_cache(target_page, block, bsize, pages,
-							page, expected);
-		if (res < 0)
-			goto mark_errored;
 
-		goto out;
+		i++;
 	}
 
+	pages = i;
+
 	/*
 	 * Create a "page actor" which will kmap and kunmap the
 	 * page cache pages appropriately within the decompressor
 	 */
-	actor = squashfs_page_actor_init_special(msblk, page, pages, 0);
+	actor = squashfs_page_actor_init_special(msblk, page, pages, expected);
 	if (actor == NULL)
 		goto out;
 
@@ -102,12 +84,12 @@ int squashfs_readpage_block(struct page *target_page, u64 block, int bsize,
 		goto mark_errored;
 	}
 
-	/* Last page may have trailing bytes not filled */
+	/* Last page (if present) may have trailing bytes not filled */
 	bytes = res % PAGE_SIZE;
-	if (bytes) {
-		pageaddr = kmap_atomic(page[pages - 1]);
+	if (page[pages - 1]->index == end_index && bytes) {
+		pageaddr = kmap_local_page(page[pages - 1]);
 		memset(pageaddr + bytes, 0, PAGE_SIZE - bytes);
-		kunmap_atomic(pageaddr);
+		kunmap_local(pageaddr);
 	}
 
 	/* Mark pages as uptodate, unlock and release */
@@ -140,36 +122,3 @@ int squashfs_readpage_block(struct page *target_page, u64 block, int bsize,
 	kfree(page);
 	return res;
 }
-
-
-static int squashfs_read_cache(struct page *target_page, u64 block, int bsize,
-	int pages, struct page **page, int bytes)
-{
-	struct inode *i = target_page->mapping->host;
-	struct squashfs_cache_entry *buffer = squashfs_get_datablock(i->i_sb,
-						 block, bsize);
-	int res = buffer->error, n, offset = 0;
-
-	if (res) {
-		ERROR("Unable to read page, block %llx, size %x\n", block,
-			bsize);
-		goto out;
-	}
-
-	for (n = 0; n < pages && bytes > 0; n++,
-			bytes -= PAGE_SIZE, offset += PAGE_SIZE) {
-		int avail = min_t(int, bytes, PAGE_SIZE);
-
-		if (page[n] == NULL)
-			continue;
-
-		squashfs_fill_page(page[n], buffer, offset, avail);
-		unlock_page(page[n]);
-		if (page[n] != target_page)
-			put_page(page[n]);
-	}
-
-out:
-	squashfs_cache_put(buffer);
-	return res;
-}
-- 
2.34.1



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
