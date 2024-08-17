Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B27955718
	for <lists+squashfs-devel@lfdr.de>; Sat, 17 Aug 2024 12:05:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1sfGIq-0005vj-0s;
	Sat, 17 Aug 2024 10:04:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sfGIk-0005vY-03
 for squashfs-devel@lists.sourceforge.net;
 Sat, 17 Aug 2024 10:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=77c0kfK/JkE/jJMiA8TmdX/Mnm8CCVLN/sX3sEvrK3Y=; b=Z0F80fCdMW6AzjjAZclsUpL1Wb
 4G1yG3zLm8FbNz9dHElbuzbuMAtFTl50ZDURJXZxCLaJsy8MDBm9xHpF3A+qy0goyBGI9RYqhOLZ0
 3sHP9j4RN5mf61mNXnmmtUzTMEACjXZGzlJ/4rzd3fwS7rZmYMx3xyhowFfRD3hhDNxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=77c0kfK/JkE/jJMiA8TmdX/Mnm8CCVLN/sX3sEvrK3Y=; b=B
 HGjag41CrJeMJ+W9PQq7vE4onji151AbW+uacKp5xUTarltyk9rGVDPYZvBO1wMwLZeyw6IusdM7Z
 qqqxCy73Y8FH87zRI1pqXp6KSLvgB+89RyoqIqnWhDFq0UEiGEBPHCKyhtR93IV1cO3hmc8bvjA7T
 oWknpAtfKwGNE4aI=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sfGIi-00076k-8U for squashfs-devel@lists.sourceforge.net;
 Sat, 17 Aug 2024 10:04:49 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WmDqd5925z20lsM;
 Sat, 17 Aug 2024 17:59:57 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id EE583180043;
 Sat, 17 Aug 2024 18:04:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 17 Aug
 2024 18:04:34 +0800
To: <phillip@squashfs.org.uk>, <willy@infradead.org>
Date: Sat, 17 Aug 2024 18:11:45 +0800
Message-ID: <20240817101146.2347378-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]:
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Li Zetao
 <lizetao1@huawei.com>
 --- fs/squashfs/file.c | 31 ++++++++++++++++ fs/squashfs/file_cache.c | 2
 +- fs/squashfs/squashfs. [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.190 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.190 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [45.249.212.190 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sfGIi-00076k-8U
Subject: [Squashfs-devel] [PATCH -next 1/2] squashfs: convert
 squashfs_copy_cache() to use folio
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
From: Li Zetao via Squashfs-devel <squashfs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: squashfs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

convert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1]: https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/squashfs/file.c       | 31 ++++++++++++++++---------------
 fs/squashfs/file_cache.c |  2 +-
 fs/squashfs/squashfs.h   |  2 +-
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index a8c1e7f9a609..893043ecf973 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -378,13 +378,13 @@ void squashfs_fill_page(struct page *page, struct squashfs_cache_entry *buffer,
 }
 
 /* Copy data into page cache  */
-void squashfs_copy_cache(struct page *page, struct squashfs_cache_entry *buffer,
+void squashfs_copy_cache(struct folio *folio, struct squashfs_cache_entry *buffer,
 	int bytes, int offset)
 {
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio_inode(folio);
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
 	int i, mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
-	int start_index = page->index & ~mask, end_index = start_index | mask;
+	int start_index = folio->index & ~mask, end_index = start_index | mask;
 
 	/*
 	 * Loop copying datablock into pages.  As the datablock likely covers
@@ -394,25 +394,26 @@ void squashfs_copy_cache(struct page *page, struct squashfs_cache_entry *buffer,
 	 */
 	for (i = start_index; i <= end_index && bytes > 0; i++,
 			bytes -= PAGE_SIZE, offset += PAGE_SIZE) {
-		struct page *push_page;
+		struct folio *push_folio;
 		int avail = buffer ? min_t(int, bytes, PAGE_SIZE) : 0;
 
 		TRACE("bytes %d, i %d, available_bytes %d\n", bytes, i, avail);
 
-		push_page = (i == page->index) ? page :
-			grab_cache_page_nowait(page->mapping, i);
-
-		if (!push_page)
+		push_folio = (i == folio->index) ? folio :
+			__filemap_get_folio(folio->mapping, i,
+					    FGP_LOCK|FGP_CREAT|FGP_NOFS|FGP_NOWAIT,
+					    mapping_gfp_mask(folio->mapping));
+		if (IS_ERR(push_folio))
 			continue;
 
-		if (PageUptodate(push_page))
+		if (folio_test_uptodate(push_folio))
 			goto skip_page;
 
-		squashfs_fill_page(push_page, buffer, offset, avail);
+		squashfs_fill_page(folio_file_page(push_folio, i), buffer, offset, avail);
 skip_page:
-		unlock_page(push_page);
-		if (i != page->index)
-			put_page(push_page);
+		folio_unlock(push_folio);
+		if (i != folio->index)
+			folio_put(push_folio);
 	}
 }
 
@@ -430,7 +431,7 @@ static int squashfs_readpage_fragment(struct page *page, int expected)
 			squashfs_i(inode)->fragment_block,
 			squashfs_i(inode)->fragment_size);
 	else
-		squashfs_copy_cache(page, buffer, expected,
+		squashfs_copy_cache(page_folio(page), buffer, expected,
 			squashfs_i(inode)->fragment_offset);
 
 	squashfs_cache_put(buffer);
@@ -439,7 +440,7 @@ static int squashfs_readpage_fragment(struct page *page, int expected)
 
 static int squashfs_readpage_sparse(struct page *page, int expected)
 {
-	squashfs_copy_cache(page, NULL, expected, 0);
+	squashfs_copy_cache(page_folio(page), NULL, expected, 0);
 	return 0;
 }
 
diff --git a/fs/squashfs/file_cache.c b/fs/squashfs/file_cache.c
index 54c17b7c85fd..23d585025882 100644
--- a/fs/squashfs/file_cache.c
+++ b/fs/squashfs/file_cache.c
@@ -29,7 +29,7 @@ int squashfs_readpage_block(struct page *page, u64 block, int bsize, int expecte
 		ERROR("Unable to read page, block %llx, size %x\n", block,
 			bsize);
 	else
-		squashfs_copy_cache(page, buffer, expected, 0);
+		squashfs_copy_cache(page_folio(page), buffer, expected, 0);
 
 	squashfs_cache_put(buffer);
 	return res;
diff --git a/fs/squashfs/squashfs.h b/fs/squashfs/squashfs.h
index 5a756e6790b5..a31bd5e9c8bf 100644
--- a/fs/squashfs/squashfs.h
+++ b/fs/squashfs/squashfs.h
@@ -68,7 +68,7 @@ extern __le64 *squashfs_read_fragment_index_table(struct super_block *,
 
 /* file.c */
 void squashfs_fill_page(struct page *, struct squashfs_cache_entry *, int, int);
-void squashfs_copy_cache(struct page *, struct squashfs_cache_entry *, int,
+void squashfs_copy_cache(struct folio *, struct squashfs_cache_entry *, int,
 				int);
 
 /* file_xxx.c */
-- 
2.34.1



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
