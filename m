Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE93A955717
	for <lists+squashfs-devel@lfdr.de>; Sat, 17 Aug 2024 12:04:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1sfGIo-0004M5-9W;
	Sat, 17 Aug 2024 10:04:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sfGIk-0004Lv-4E
 for squashfs-devel@lists.sourceforge.net;
 Sat, 17 Aug 2024 10:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5gtoyu7lWd4yu6SneDd4m7mQ2YAgo56/11vKObDp60Y=; b=gxz4JTKtlCtLLwHBn83+mgPA8z
 yqX/VQ/cBSRZqQcDIfEpvPZeTa+iKz6xkwI4saGzs79A1ftB+tBdb7OyVXuTjZa1AcbcVDM4Z3enO
 v6Jokx+TdUiqbPfsxO5xj6WZ+5ZSxX/HVEAiDrrkdMBjV5kI1au8d36TlYarPk7D+8vo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5gtoyu7lWd4yu6SneDd4m7mQ2YAgo56/11vKObDp60Y=; b=PYHV79NKHjxMoT/l8rq2pShCfg
 ub3E7LgJDIOW5vFD8ptIxYeUMeo2BtXt+pA0rslPcBg3NJJvNh7DelVW9la1jLPhvJ4dwrDeZGS2q
 9R+v9LudrLOStwJ3n74s9pdGqA4JLl6qkdZEp118b1QPygHeK3LBAhXpXkP1K6aIVJfE=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sfGIi-00076l-45 for squashfs-devel@lists.sourceforge.net;
 Sat, 17 Aug 2024 10:04:49 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WmDqH3RzZz2CmjH;
 Sat, 17 Aug 2024 17:59:39 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 4BC2D140154;
 Sat, 17 Aug 2024 18:04:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 17 Aug
 2024 18:04:34 +0800
To: <phillip@squashfs.org.uk>, <willy@infradead.org>
Date: Sat, 17 Aug 2024 18:11:46 +0800
Message-ID: <20240817101146.2347378-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240817101146.2347378-1-lizetao1@huawei.com>
References: <20240817101146.2347378-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In order to remote page APIs and index field in structure
 page [1], this patch convert squashfs_read_folio to use folio APIs, switch
 from kmap_atomic to kmap_local and use folio_end_read() to set upto [...]
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.190 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.190 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.190 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sfGIi-00076l-45
Subject: [Squashfs-devel] [PATCH -next 2/2] squashfs: convert
 squashfs_read_folio to use folio APIs
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

In order to remote page APIs and index field in structure page [1],
this patch convert squashfs_read_folio to use folio APIs, switch from
kmap_atomic to kmap_local and use folio_end_read() to set uptodate
and unlock folio.

[1]: https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/squashfs/file.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 893043ecf973..8c80d77a6115 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -446,10 +446,9 @@ static int squashfs_readpage_sparse(struct page *page, int expected)
 
 static int squashfs_read_folio(struct file *file, struct folio *folio)
 {
-	struct page *page = &folio->page;
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio_inode(folio);
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	int index = page->index >> (msblk->block_log - PAGE_SHIFT);
+	int index = folio->index >> (msblk->block_log - PAGE_SHIFT);
 	int file_end = i_size_read(inode) >> msblk->block_log;
 	int expected = index == file_end ?
 			(i_size_read(inode) & (msblk->block_size - 1)) :
@@ -457,10 +456,10 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 	int res = 0;
 	void *pageaddr;
 
-	TRACE("Entered squashfs_readpage, page index %lx, start block %llx\n",
-				page->index, squashfs_i(inode)->start);
+	TRACE("Entered squashfs_readpage, folio index %lx, start block %llx\n",
+				folio->index, squashfs_i(inode)->start);
 
-	if (page->index >= ((i_size_read(inode) + PAGE_SIZE - 1) >>
+	if (folio->index >= ((i_size_read(inode) + PAGE_SIZE - 1) >>
 					PAGE_SHIFT))
 		goto out;
 
@@ -473,23 +472,21 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 			goto out;
 
 		if (res == 0)
-			res = squashfs_readpage_sparse(page, expected);
+			res = squashfs_readpage_sparse(&folio->page, expected);
 		else
-			res = squashfs_readpage_block(page, block, res, expected);
+			res = squashfs_readpage_block(&folio->page, block, res, expected);
 	} else
-		res = squashfs_readpage_fragment(page, expected);
+		res = squashfs_readpage_fragment(&folio->page, expected);
 
 	if (!res)
 		return 0;
 
 out:
-	pageaddr = kmap_atomic(page);
+	pageaddr = kmap_local_folio(folio, 0);
 	memset(pageaddr, 0, PAGE_SIZE);
-	kunmap_atomic(pageaddr);
-	flush_dcache_page(page);
-	if (res == 0)
-		SetPageUptodate(page);
-	unlock_page(page);
+	kunmap_local(pageaddr);
+	flush_dcache_folio(folio);
+	folio_end_read(folio, res == 0);
 
 	return res;
 }
-- 
2.34.1



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
